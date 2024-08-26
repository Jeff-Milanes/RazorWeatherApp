import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:razor_erp_weather_app/features/weather/api/weather_api.dart';
import 'package:razor_erp_weather_app/features/weather/repository/weather_repository.dart';

import '../../../helpers/hydrated_bloc.dart';

class MockWeatherApi extends Mock implements WeatherApi {}

void main() {
    initHydratedStorage();
    
  late WeatherRepositoryImpl weatherRepository;
  late MockWeatherApi mockWeatherApi;

  setUp(() {
    mockWeatherApi = MockWeatherApi();
    weatherRepository = WeatherRepositoryImpl(mockWeatherApi);
  });
    test('should return weather data from WeatherApi when getCurrentWeather is called', () async {
      // Arrange
      final testWeather = Weather((b) => b..currentLocation.locationName = 'test city');
      when(() => mockWeatherApi.getCurrentWeather(any(), any()))
          .thenAnswer((_) async => testWeather);

      // Act
      final result = await weatherRepository.getCurrentWeather(10.0, 20.0);

      // Assert
      expect(result, equals(testWeather));
      verify(() => mockWeatherApi.getCurrentWeather(10.0, 20.0)).called(1);
    });

    test('should return null if WeatherApi returns null', () async {
      // Arrange
      when(() => mockWeatherApi.getCurrentWeather(any(), any()))
          .thenAnswer((_) async => null);

      // Act
      final result = await weatherRepository.getCurrentWeather(10.0, 20.0);

      // Assert
      expect(result, isNull);
      verify(() => mockWeatherApi.getCurrentWeather(10.0, 20.0)).called(1);
    });
 
}