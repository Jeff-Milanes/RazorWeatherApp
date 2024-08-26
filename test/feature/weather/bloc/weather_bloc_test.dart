import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mocktail/mocktail.dart';
import 'package:razor_erp_weather_app/features/weather/api/src/models/weather.dart';
import 'package:razor_erp_weather_app/features/weather/bloc/weather_bloc.dart';
import 'package:razor_erp_weather_app/features/weather/repository/src/weather_repository.dart';

import '../../../helpers/hydrated_bloc.dart';

class MockWeatherRepository extends Mock implements WeatherRepository {}
class MockGeolocatorPlatform extends Mock implements GeolocatorPlatform {}

void main() {
  initHydratedStorage();
  
  late WeatherBloc weatherBloc;
  late MockWeatherRepository mockWeatherRepository;
  late MockGeolocatorPlatform mockGeolocatorPlatform;

  setUp(() {
    mockWeatherRepository = MockWeatherRepository();
    mockGeolocatorPlatform = MockGeolocatorPlatform();
    weatherBloc = WeatherBloc(mockWeatherRepository, mockGeolocatorPlatform);
  });

  test('initial state is correct', () {
    expect(weatherBloc.state, const WeatherState());
  });

  test('handlePermission: Location service enabled and permission granted', () async {
      // Arrange
      when(() => mockGeolocatorPlatform.isLocationServiceEnabled())
          .thenAnswer((_) async => true);
      when(() => mockGeolocatorPlatform.checkPermission())
          .thenAnswer((_) async => LocationPermission.whileInUse);

      // Act
      final hasPermission = await weatherBloc.handlePermission();

      // Assert
      expect(hasPermission, isTrue);
    });

    test('handlePermission: Location service disabled', () async {
      // Arrange
      when(() => mockGeolocatorPlatform.isLocationServiceEnabled())
          .thenAnswer((_) async => false);
      when(() => mockGeolocatorPlatform.openLocationSettings())
          .thenAnswer((_) async => true);

      // Act
      final hasPermission = await weatherBloc.handlePermission();

      // Assert
      expect(hasPermission, isFalse);
    });

    test('handlePermission: Location service enabled but permission denied', () async {
      // Arrange
      when(() => mockGeolocatorPlatform.isLocationServiceEnabled())
          .thenAnswer((_) async => true);
      when(() => mockGeolocatorPlatform.checkPermission())
          .thenAnswer((_) async => LocationPermission.denied);
      when(() => mockGeolocatorPlatform.requestPermission()).thenAnswer((_) async => LocationPermission.denied);

      // Act
      final hasPermission = await weatherBloc.handlePermission();

      // Assert
      expect(hasPermission, isFalse);
    });


  blocTest<WeatherBloc, WeatherState>(
    'emits [loading, success] when WeatherFetched is added and data is successfully fetched',
    build: () {
      when(() => mockGeolocatorPlatform.isLocationServiceEnabled())
          .thenAnswer((_) async => true);
      when(() => mockGeolocatorPlatform.checkPermission())
          .thenAnswer((_) async => LocationPermission.whileInUse);

       when(() => mockGeolocatorPlatform.getCurrentPosition())
          .thenAnswer((_) async => Position(longitude: 1, latitude: 1, timestamp: DateTime.now(), accuracy: 1, altitude: 1, altitudeAccuracy: 1, heading: 1, headingAccuracy: 1, speed: 1, speedAccuracy: 1));
          
      when(() => mockWeatherRepository.getCurrentWeather(1.0, 1.0))
          .thenAnswer((_) async => Weather((b) => b..currentLocation.locationName = 'test city',));
      return weatherBloc;
    },
    act: (bloc) => bloc.add(const WeatherFetched()),
    expect: () => [
      const WeatherState(
        status: WeatherStatus.success,
        locationName: 'test city',
        weather: [],
      ),
    ],
  );

  blocTest<WeatherBloc, WeatherState>(
    'emits [loading, failure] when WeatherFetched is added and an error occurs',
    build: () {
      when(() => mockGeolocatorPlatform.getCurrentPosition())
          .thenThrow(Exception('Failed to get location'));
      return weatherBloc;
    },
    act: (bloc) => bloc.add(const WeatherFetched()),
    expect: () => [
      const WeatherState(status: WeatherStatus.failure),
    ],
  );
}
