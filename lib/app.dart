import 'package:flutter/material.dart' hide Router;
import 'package:razor_erp_weather_app/core/dependency_injection.dart';
import 'package:razor_erp_weather_app/core/router.dart';


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig: DependencyInjection.instance<Router>().routes,
    );
  }
}