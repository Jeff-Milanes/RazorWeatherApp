import 'package:razor_erp_weather_app/common/environment_variables.dart';

abstract final class ApiEndpoints {
  static const String baseUrl = EnvironmentVariables.appServerUrl;

  static String location({ required double lat, required double lng}) {
    return '$baseUrl?lat=$lat&lon=$lng';
  }
}