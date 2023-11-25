import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app_okta/core/errors/failures.dart';
import 'package:weather_app_okta/core/utils/helper.dart';
import 'package:weather_app_okta/core/utils/location_helper.dart';
import 'package:weather_app_okta/weather/data/models/weather_list_model.dart';
import 'package:weather_app_okta/weather/domain/usecases/weather_usecase.dart';
import 'package:weather_app_okta/weather/presentation/provider/weather_list_state.dart';
import 'package:flutter/material.dart';

class WeatherListProvider with ChangeNotifier {
  // initial
  final GetWeatherList getWeatherList;
  WeatherListState _state = WeatherListInitial();
  WeatherListModel? _weatherList;

  // constructor
  WeatherListProvider({
    required this.getWeatherList,
  });

  // setter
  set setWeatherList(val) {
    _weatherList = val;
  }

  set setState(val) {
    _state = val;
    notifyListeners();
  }

  // getter
  WeatherListState get state => _state;
  WeatherListModel get weatherList => _weatherList!;

  // method
  Future<void> fetchData() async {
    setState = WeatherListLoading();
    late Either<Failure, WeatherListModel> result;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) async {
      result = await getWeatherList(position);
      await Future.delayed(const Duration(milliseconds: 500));
      result.fold(
        (failure) => setState = WeatherListFailed(failure: failure),
        (data) {
          setState = const WeatherListLoaded();
          setWeatherList = data;
        },
      );
    }).catchError((e) {
      logMe(e);
      return e;
    });
  }
}
