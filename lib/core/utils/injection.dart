import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_app_okta/core/network/dio_client.dart';
import 'package:weather_app_okta/core/network/network_info.dart';
import 'package:weather_app_okta/features/login/presentation/providers/login_providers.dart';
import 'package:weather_app_okta/features/register/presentation/providers/register_providers.dart';
import 'package:weather_app_okta/weather/data/datasources/weather_datasource.dart';
import 'package:weather_app_okta/weather/data/repositories/weather_repository_implementation.dart';
import 'package:weather_app_okta/weather/domain/repositories/weather_repository.dart';
import 'package:weather_app_okta/weather/domain/usecases/weather_usecase.dart';
import 'package:weather_app_okta/weather/presentation/provider/weather_list_provider.dart';

final locator = GetIt.instance;

Future<void> locatorInit() async {
  //provider
  locator.registerFactory<LoginProvider>(() => LoginProvider());
  locator.registerFactory<RegisterProvider>(() => RegisterProvider());
  locator.registerFactory<WeatherListProvider>(
      () => WeatherListProvider(getWeatherList: locator()));

  //data sources
  locator.registerLazySingleton<WeatherDataSource>(
      () => WeatherDataSourceImplementation(dio: locator()));

  //use case
  locator
      .registerLazySingleton<GetWeatherList>(() => GetWeatherList(locator()));

  //repository
  locator.registerLazySingleton<WeatherDataRepository>(
    () => WeatherDataRepositoryImplementation(
      dataSource: locator(),
      networkInfo: locator(),
    ),
  );

  //external
  locator.registerLazySingleton<GlobalKey<NavigatorState>>(
      () => GlobalKey<NavigatorState>());
  locator.registerFactory<Dio>(() => DioClient().dio);
  locator.registerLazySingleton<Connectivity>(() => Connectivity());

  //network info
  locator.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImplementation(locator()));
}
