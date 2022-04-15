import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_app/core/errors/failures.dart';
import 'package:weather_app/weather/domain/entities/weather.dart';
import 'package:weather_app/weather/domain/repositories/weather_repository.dart';
import 'package:weather_app/weather/domain/usecases/get_weather_usecase.dart';

class MockCurrentWeatherRepository extends Mock implements WeatherRepository {}

void main() {
  late GetWeatherUseCase usecase;
  late MockCurrentWeatherRepository mockCurrentWeatherRepository;

  setUp(() {
    mockCurrentWeatherRepository = MockCurrentWeatherRepository();
    usecase = GetWeatherUseCase(mockCurrentWeatherRepository);
  });
  const tQuery = 'Muzambinho';

  const tWeather = Weather(
    location: Location(
      name: 'Muzambinho',
      region: 'Minas Gerais',
      country: 'Brazil',
      localtime: '2022-02-07 23:39',
    ),
    current: Current(
      condition: Condition(
        code: 1189,
        text: 'Moderate rain',
        icon: '//cdn.weatherapi.com/weather/64x64/night/302.png',
      ),
      lastUpdated: '2022-02-07 23:30',
      temperatureC: 18.6,
      temperatureF: 65.5,
      uv: 1,
      preciptationMM: 5.6,
      humidity: 99,
    ),
  );

  test('should return a current weather entity from the repository', () async {
    //arrange
    when(
      () => mockCurrentWeatherRepository.getWeather(query: any(named: 'query')),
    ).thenAnswer(
      (_) async => const Right(tWeather),
    );

    //action
    final result = await usecase(const GetWeatherParams(tQuery));

    // assert
    expect(result, const Right<Failure, Weather>(tWeather));
    verify(() => mockCurrentWeatherRepository.getWeather(query: tQuery))
        .called(1);
  });
}
