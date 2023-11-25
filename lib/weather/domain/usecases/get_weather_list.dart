import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app_okta/weather/data/models/weather_list_model.dart';

import '../../../../core/errors/failures.dart';

abstract class WeatherListUseCase<Type> {
  Future<Either<Failure, WeatherListModel>> call(Position position);
}
