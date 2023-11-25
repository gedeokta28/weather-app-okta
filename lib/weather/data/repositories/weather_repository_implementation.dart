import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app_okta/core/errors/failures.dart';
import 'package:weather_app_okta/core/utils/helper.dart';
import 'package:weather_app_okta/weather/data/datasources/weather_datasource.dart';
import 'package:weather_app_okta/weather/data/models/weather_list_model.dart';
import 'package:weather_app_okta/weather/domain/repositories/weather_repository.dart';

import '../../../../core/network/network_info.dart';

class WeatherDataRepositoryImplementation extends WeatherDataRepository {
  final WeatherDataSource dataSource;
  final NetworkInfo networkInfo;

  WeatherDataRepositoryImplementation(
      {required this.dataSource, required this.networkInfo});

  @override
  Future<Either<Failure, WeatherListModel>> getWeatherList(
      Position position) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await dataSource.getWeatherList(position);
        return Right(result);
      } catch (e) {
        logMe('Errrrorrrrr');
        logMe(e.toString());
        return const Left(ServerFailure(''));
      }
    }
    return const Left(ServerFailure(''));
  }
}
