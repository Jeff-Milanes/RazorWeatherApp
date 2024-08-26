import 'package:injectable/injectable.dart';
import 'package:razor_erp_weather_app/features/weather/api/weather_api.dart';

abstract class WeatherRepository {
  Future<Weather?> getCurrentWeather(double lat, double lng);
}

@LazySingleton(as: WeatherRepository)
class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherApi _weatherApi;

  WeatherRepositoryImpl(this._weatherApi);

  @override
  Future<Weather?> getCurrentWeather(double lat, double lng) => _weatherApi.getCurrentWeather(lat, lng);
}