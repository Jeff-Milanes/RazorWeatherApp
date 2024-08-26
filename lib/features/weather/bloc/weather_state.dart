part of 'weather_bloc.dart';

enum WeatherStatus { loading, success, failure }

@JsonSerializable()
final class WeatherState extends Equatable {
  const WeatherState({
    this.locationName  = '',
    this.weather = const [],
    this.status = WeatherStatus.loading,
  });

  factory WeatherState.fromJson(Map<String, dynamic> json) =>
      _$WeatherStateFromJson(json);

  final String locationName;
  final List<Weather> weather;
  final WeatherStatus status;

  WeatherState copyWith({
    String? locationName,
    List<Weather>? weather,
    WeatherStatus? status,
  }) {
    return WeatherState(
      locationName: locationName ?? this.locationName,
      weather: weather ?? this.weather,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toJson() => _$WeatherStateToJson(this);

  @override
  List<Object?> get props => [locationName, weather, status];
}
