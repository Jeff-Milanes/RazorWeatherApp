import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:geolocator/geolocator.dart';
import 'package:razor_erp_weather_app/features/weather/bloc/models/weather_model.dart';
import 'package:razor_erp_weather_app/features/weather/weather.dart';

import '../../../helpers/hydrated_bloc.dart';

class MockWeatherRepository extends Mock implements WeatherRepository {}
class MockGeolocatorPlatform extends Mock implements GeolocatorPlatform {}
class MockWeatherBloc extends MockBloc<WeatherEvent, WeatherState> implements WeatherBloc {}

void main() {
  initHydratedStorage();

  late WeatherRepository mockWeatherRepository;
  late GeolocatorPlatform mockGeolocatorPlatform;
  late MockWeatherBloc mockWeatherBloc;

  setUp(() {
    mockWeatherRepository = MockWeatherRepository();
    mockGeolocatorPlatform = MockGeolocatorPlatform();
    mockWeatherBloc = MockWeatherBloc();
  });

  testWidgets('WeatherPage displays loading indicator', (WidgetTester tester) async {

    when(() => mockWeatherBloc.state).thenReturn(const WeatherState(status: WeatherStatus.loading));

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<WeatherBloc>(
          create: (context) => WeatherBloc(
            mockWeatherRepository,
            mockGeolocatorPlatform,
          ),
          child: const WeatherView(),
        ),
      ),
    );

    expect(find.byType(CircularProgressIndicator), findsOne);
  });

  testWidgets('WeatherPage displays weather info on success', (WidgetTester tester) async {
    when(() => mockWeatherBloc.state).thenReturn(WeatherState(status: WeatherStatus.success, locationName: 'test', weather: [
    Weather(
            date: '2024-08-26',
            humidity: 65,
            icon: '01d',
            precipitation: 0,
            temp: 23,
            tempFeel: 22,
            tempMax: 25,
            tempMin: 20,
            visibility: '10 km',
            weather: 'Clear'
          ),
    ]));

     await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<WeatherBloc>(
          create: (context) => WeatherBloc(
            mockWeatherRepository,
            mockGeolocatorPlatform,
          )..add(const WeatherFetched()),
          child: const WeatherView(),
        ),
      ),
    );

    expect(find.byType(Container), findsAny);

  });

  testWidgets('WeatherPage displays error message on failure', (WidgetTester tester) async {
    when(() => mockWeatherBloc.state).thenThrow(Exception('Error')); 

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<WeatherBloc>(
          create: (context) => WeatherBloc(
            mockWeatherRepository,
            mockGeolocatorPlatform,
          )..add(const WeatherFetched()),
          child: const WeatherView(),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('An error occurs.'), findsOneWidget);
  });
}
