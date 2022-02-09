import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/core/errors/failures.dart';
import 'package:weather_app/core/usecases/usecase.dart';
import 'package:weather_app/weather/domain/entities/weather.dart';
import 'package:weather_app/weather/domain/repositories/weather_repository.dart';

class GetWeatherUseCase implements UseCase<Weather, GetWeatherParams> {
  final CurrentWeatherRepository repository;

  GetWeatherUseCase(this.repository);
  @override
  Future<Either<Failure, Weather>> call(GetWeatherParams params) async {
    return await repository.getWeather(query: params.query);
  }
}

class GetWeatherParams extends Equatable {
  final String query;

  const GetWeatherParams(this.query);

  @override
  List<Object?> get props => [query];
}
