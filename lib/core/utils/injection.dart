import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_app_okta/core/network/network_info.dart';
import 'package:weather_app_okta/features/login/presentation/providers/login_providers.dart';

final locator = GetIt.instance;

Future<void> locatorInit() async {
  //provider
  locator.registerFactory<LoginProvider>(() => LoginProvider());

  //external
  locator.registerLazySingleton<GlobalKey<NavigatorState>>(
      () => GlobalKey<NavigatorState>());
  locator.registerLazySingleton<Connectivity>(() => Connectivity());

  //network info
  locator.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImplementation(locator()));
}
