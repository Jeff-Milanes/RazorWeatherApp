part of 'weather_bloc.dart';

sealed class WeatherEvent {
  const WeatherEvent();
}

final class WeatherFetched extends WeatherEvent {
  const WeatherFetched();
}