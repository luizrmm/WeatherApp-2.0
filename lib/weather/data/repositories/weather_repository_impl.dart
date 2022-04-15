import 'package:dartz/dartz.dart';
import 'package:weather_app/core/errors/failures.dart';
import 'package:weather_app/weather/data/datasources/weather_datasource.dart';
import 'package:weather_app/weather/data/mappers/weather_mapper.dart';
import 'package:weather_app/weather/domain/entities/weather.dart';
import 'package:weather_app/weather/domain/failures/weather_exceptions.dart';
import 'package:weather_app/weather/domain/failures/weather_failures.dart';
import 'package:weather_app/weather/domain/repositories/weather_repository.dart';

class WeatherRepositoryImpl extends WeatherRepository {
  WeatherRepositoryImpl({required this.datasource});
  final WeatherDatasource datasource;
  @override
  Future<Either<Failure, Weather>> getWeather({required String query}) async {
    try {
      final weatherModel = await datasource.getWeather(query);
      return Right(WeatherMapper.toEntity(weatherModel));
    } on GetWeatherException {
      return Left(GetCurrentWeatherFailure());
    }
  }
}
