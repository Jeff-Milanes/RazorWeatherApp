import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:razor_erp_weather_app/features/weather/bloc/models/weather_model.dart';
import 'package:razor_erp_weather_app/features/weather/repository/weather_repository.dart';

part 'weather_bloc.g.dart';
part 'weather_event.dart';
part 'weather_state.dart';

@injectable
class WeatherBloc extends HydratedBloc<WeatherEvent, WeatherState> {
  WeatherBloc(this._weatherRepository, this._geolocatorPlatform) : super(const WeatherState()) {
    on<WeatherFetched>(_onWeatherFetch);
  }

  final WeatherRepository _weatherRepository;
  final GeolocatorPlatform _geolocatorPlatform;

  Future<void> _onWeatherFetch(WeatherFetched event, Emitter<WeatherState> emit) async {
    try {

    final hasPermission = await handlePermission();

    if (!hasPermission) {
      await handlePermission();
    }

    final position = await _geolocatorPlatform.getCurrentPosition();
    final weather = await _weatherRepository.getCurrentWeather(position.latitude, position.longitude);

    final weatherList = weather?.list.map((w) => Weather(date: _convertTimestampToDate(w.dateTime), weather: _capitalizeWords(w.weatherConditions.first.description), icon: w.weatherConditions.first.icon, temp: _convertKelvinToCelsius(w.weatherDetails.temp), tempMin: _convertKelvinToCelsius(w.weatherDetails.tempMin), tempMax: _convertKelvinToCelsius(w.weatherDetails.tempMax), precipitation: _convertToPercentage(w.precipitation), humidity: w.weatherDetails.humidity.toInt(), tempFeel: _convertKelvinToCelsius(w.weatherDetails.tempFeels), visibility: _convertMeterToKilometer(w.visibility))).toList();

    emit(state.copyWith(status: WeatherStatus.success, locationName: weather?.currentLocation.locationName, weather: weatherList));

    } catch (e) {
      emit(state.copyWith(status: WeatherStatus.failure));
    }
  } 

  Future<bool> handlePermission() async {
    final isLocationServiceEnabled =  await _geolocatorPlatform.isLocationServiceEnabled();

    if (!isLocationServiceEnabled) {
      await _geolocatorPlatform.openLocationSettings();

      return false;
    } 

    final permission = await _geolocatorPlatform.checkPermission();

    if (permission == LocationPermission.denied || 
        permission == LocationPermission.deniedForever) {
      await _geolocatorPlatform.requestPermission();

      return false;
    }

    return true;
  }

  int _convertKelvinToCelsius(double kelvin)  {
    final celsius = kelvin - 273.15;
    return celsius.round();
  }

  String _convertTimestampToDate(int unixTimestamp) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(unixTimestamp * 1000);
    DateFormat dateFormat = DateFormat('E, MMM d, h:mm a');
    String formattedDate = dateFormat.format(dateTime);
  
    return formattedDate;
  }

  String _convertMeterToKilometer(int meters) {
    double kilometers = meters / 1000;

    return '${kilometers.toInt()}km';
  }

  int _convertToPercentage(double decimal) {
    return (decimal * 100).round();
  }

  String _capitalizeWords(String input) {
  if (input.isEmpty) {
    return input;
  }

  return input.split(' ').map((word) {
    if (word.isEmpty) {
      return '';
    }
    return word[0].toUpperCase() + word.substring(1).toLowerCase();
  }).join(' ');
}

  
  @override
  WeatherState? fromJson(Map<String, dynamic> json) => WeatherState.fromJson(json);
  
  @override
  Map<String, dynamic>? toJson(WeatherState state) => state.toJson();
}
