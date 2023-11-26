import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app_okta/core/errors/failures.dart';
import 'package:weather_app_okta/features/weather/data/models/weather_list_model.dart';

abstract class WeatherDataRepository {
  Future<Either<Failure, WeatherListModel>> getWeatherList(Position position);
}
