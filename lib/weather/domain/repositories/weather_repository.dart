import 'package:dartz/dartz.dart';
import 'package:weather_app/core/errors/failures.dart';
import 'package:weather_app/weather/domain/entities/weather.dart';

abstract class CurrentWeatherRepository {
  Future<Either<Failure, Weather>> getWeather({required String query});
}
