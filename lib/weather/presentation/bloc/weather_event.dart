part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

class GetWeatherEvent extends WeatherEvent {
  const GetWeatherEvent({required this.query});
  final String query;

  @override
  List<Object> get props => [query];
}
