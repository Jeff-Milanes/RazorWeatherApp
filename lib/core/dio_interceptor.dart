import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:razor_erp_weather_app/common/environment_variables.dart';

class DioInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    
    final uri = options.uri;
    final queryParameters = Map<String, dynamic>.from(uri.queryParameters);
    queryParameters['appid'] = EnvironmentVariables.openWeatherAppId;

    final updatedUrl = Uri(
      scheme: uri.scheme,
      host: uri.host,
      path: uri.path,
      queryParameters: queryParameters,
    ).toString();

    log('Updated Request URI: ${updatedUrl.toString()}');

    options.path = updatedUrl;

    handler.next(options);
  }
}