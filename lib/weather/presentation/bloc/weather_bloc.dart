import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:weather_app/weather/domain/entities/weather.dart';
import 'package:weather_app/weather/domain/usecases/get_weather_usecase.dart';

part 'weather_event.dart';
part 'weather_state.dart';

// ignore: constant_identifier_names
const String GET_WEATHER_MESSAGE_ERROR = 'Failed to get current weather';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final GetWeatherUseCase useCase;

  WeatherBloc({required this.useCase}) : super(const WeatherInitial()) {
    on<GetWeatherEvent>(_getWeather);
  }
  Future<void> _getWeather(
      GetWeatherEvent event, Emitter<WeatherState> emit) async {
    emit(const WeatherLoading());
    final result = await useCase(GetWeatherParams(event.query));
    result.fold(
      (failure) =>
          emit(WeatherError(failure.message ?? GET_WEATHER_MESSAGE_ERROR)),
      (succes) => emit(WeatherSuccess(succes)),
    );
  }
}
