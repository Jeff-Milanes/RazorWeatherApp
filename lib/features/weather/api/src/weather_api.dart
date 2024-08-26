
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:razor_erp_weather_app/common/api_endpoints.dart';
import 'package:razor_erp_weather_app/core/dio_interceptor.dart';
import 'package:razor_erp_weather_app/features/weather/api/weather_api.dart';

abstract class WeatherApi {
  Future<Weather?> getCurrentWeather(double lat, double lng);
}

@LazySingleton(as: WeatherApi)
class WeatherApiImpl implements WeatherApi {
  final Dio _dio;

  WeatherApiImpl(this._dio) {
    _dio.interceptors.add(DioInterceptor());
  }

  @override
  Future<Weather?> getCurrentWeather(double lat, double lng) async {
    final response = await _dio.get(ApiEndpoints.location(lat: lat,lng: lng));
    final result = Weather.fromJson(response.data);

    return result;
  }


}
