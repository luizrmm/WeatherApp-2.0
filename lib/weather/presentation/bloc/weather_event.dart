part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

class GetWeatherEvent extends WeatherEvent {
  final String query;
  const GetWeatherEvent({required this.query});

  @override
  List<Object> get props => [query];
}
