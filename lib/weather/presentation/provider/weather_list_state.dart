import 'package:equatable/equatable.dart';
import 'package:weather_app_okta/core/errors/failures.dart';
import 'package:weather_app_okta/weather/data/models/weather_list_model.dart';

abstract class WeatherListState extends Equatable {
  final WeatherListModel? data;

  const WeatherListState({this.data});

  @override
  List<Object?> get props => [data];
}

class WeatherListInitial extends WeatherListState {}

class WeatherListLoading extends WeatherListState {}

class WeatherListLoaded extends WeatherListState {
  const WeatherListLoaded({WeatherListModel? data}) : super(data: data);

  @override
  List<Object?> get props => [data];
}

class WeatherListFailed extends WeatherListState {
  final Failure failure;

  const WeatherListFailed({required this.failure});

  @override
  List<Object?> get props => [data, failure];
}
