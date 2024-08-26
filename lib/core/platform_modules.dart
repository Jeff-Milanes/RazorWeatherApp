import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';

@module  
abstract class PlatformModules {  
  @lazySingleton
  Dio get dio => Dio();

  @lazySingleton
  GeolocatorPlatform get geoLocation => GeolocatorPlatform.instance;
}