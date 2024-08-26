// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:geolocator/geolocator.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:razor_erp_weather_app/core/platform_modules.dart' as _i11;
import 'package:razor_erp_weather_app/core/router.dart' as _i8;
import 'package:razor_erp_weather_app/features/weather/api/src/weather_api.dart'
    as _i5;
import 'package:razor_erp_weather_app/features/weather/api/weather_api.dart'
    as _i7;
import 'package:razor_erp_weather_app/features/weather/bloc/weather_bloc.dart'
    as _i9;
import 'package:razor_erp_weather_app/features/weather/repository/src/weather_repository.dart'
    as _i6;
import 'package:razor_erp_weather_app/features/weather/repository/weather_repository.dart'
    as _i10;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $register(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final platformModules = _$PlatformModules();
  gh.lazySingleton<_i3.Dio>(() => platformModules.dio);
  gh.lazySingleton<_i4.GeolocatorPlatform>(() => platformModules.geoLocation);
  gh.lazySingleton<_i5.WeatherApi>(() => _i5.WeatherApiImpl(gh<_i3.Dio>()));
  gh.lazySingleton<_i6.WeatherRepository>(
      () => _i6.WeatherRepositoryImpl(gh<_i7.WeatherApi>()));
  gh.lazySingleton<_i8.Router>(() => _i8.RouterImpl());
  gh.factory<_i9.WeatherBloc>(() => _i9.WeatherBloc(
        gh<_i10.WeatherRepository>(),
        gh<_i4.GeolocatorPlatform>(),
      ));
  return getIt;
}

class _$PlatformModules extends _i11.PlatformModules {}
