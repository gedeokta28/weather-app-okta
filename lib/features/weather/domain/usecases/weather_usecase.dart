import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app_okta/features/weather/data/models/weather_list_model.dart';
import 'package:weather_app_okta/features/weather/domain/repositories/weather_repository.dart';
import 'package:weather_app_okta/features/weather/domain/usecases/get_weather_list.dart';

import '../../../../../core/errors/failures.dart';

class GetWeatherList implements WeatherListUseCase<WeatherListModel> {
  final WeatherDataRepository repository;

  GetWeatherList(this.repository);

  @override
  Future<Either<Failure, WeatherListModel>> call(Position position) async {
    return await repository.getWeatherList(position);
  }
}
