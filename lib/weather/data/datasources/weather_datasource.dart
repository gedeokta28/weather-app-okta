import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app_okta/core/utils/helper.dart';
import 'package:weather_app_okta/weather/data/models/weather_list_model.dart';

abstract class WeatherDataSource {
  Future<WeatherListModel> getWeatherList(Position position);
}

class WeatherDataSourceImplementation implements WeatherDataSource {
  final Dio dio;

  const WeatherDataSourceImplementation({required this.dio});

  @override
  Future<WeatherListModel> getWeatherList(Position position) async {
    var path =
        '?lat=${position.latitude}&lon=${position.longitude}&appid=4cd3b09e5e642ff3e7f2a4b36c2dec4e&units=metric';
    try {
      final response = await dio.get(path);
      return WeatherListModel.fromJson(response.data);
    } catch (e) {
      logMe(e);
      rethrow;
    }
  }
}
