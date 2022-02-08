import 'package:dartz/dartz.dart';
import 'package:weather_app/core/errors/failures.dart';
import 'package:weather_app/weather/domain/entities/current_weather.dart';

abstract class CurrentWeatherRepository {
  Future<Either<Failure, CurrentWeather>> getWeather({required String query});
}
