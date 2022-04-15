part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherInitial extends WeatherState {
  const WeatherInitial();
}

class WeatherLoading extends WeatherState {
  const WeatherLoading();
}

class WeatherSuccess extends WeatherState {
  const WeatherSuccess(this.weather);
  final Weather weather;

  @override
  List<Object> get props => [weather];
}

class WeatherError extends WeatherState {
  const WeatherError(this.message);
  final String message;

  @override
  List<Object> get props => [message];
}
