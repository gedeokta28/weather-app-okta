import 'package:flutter/material.dart';
import 'package:weather_app_okta/features/login/presentation/pages/login_page.dart';
import 'package:weather_app_okta/features/register/presentation/pages/register_page.dart';
import 'package:weather_app_okta/weather/presentation/pages/weather_list_page.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LoginPage.routeName:
      return MaterialPageRoute(builder: (_) => const LoginPage());
    case RegisterPage.routeName:
      return MaterialPageRoute(builder: (_) => const RegisterPage());
    case WeatherListPage.routeName:
      return MaterialPageRoute(builder: (_) => const WeatherListPage());
    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        ),
      );
  }
}
