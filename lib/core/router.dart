import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:razor_erp_weather_app/features/weather/weather.dart';

abstract interface class Router {
  GoRouter get routes;
}

@LazySingleton(as: Router)
class RouterImpl implements Router {
  @override
  GoRouter get routes => GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const WeatherPage();
      },
    ),
  ],
  );
}
