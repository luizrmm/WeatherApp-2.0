import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_app/weather/domain/entities/current_weather.dart';
import 'package:weather_app/weather/domain/repositories/current_weather_repository.dart';
import 'package:weather_app/weather/domain/usecases/get_weather_usecase.dart';

class MockCurrentWeatherRepository extends Mock
    implements CurrentWeatherRepository {}

void main() {
  late GetWeatherUseCase usecase;
  late MockCurrentWeatherRepository mockCurrentWeatherRepository;

  setUp(() {
    mockCurrentWeatherRepository = MockCurrentWeatherRepository();
    usecase = GetWeatherUseCase(mockCurrentWeatherRepository);
  });
  const String tQuery = 'Muzambinho';

  final CurrentWeather tWeather = CurrentWeather(
    location: Location(
      name: 'Muzambinho',
      region: 'Minas Gerais',
      country: 'Brazil',
      localtime: DateTime.parse('2022-02-07 23:39'),
    ),
    condition: const Condition(
      code: 1189,
      text: 'Moderate rain',
      icon: '//cdn.weatherapi.com/weather/64x64/night/302.png',
    ),
    lastUpdate: DateTime.parse('2022-02-07 23:30'),
    temperatureC: 18.6,
    temperatureF: 65.5,
    uv: 1.0,
    preciptationMM: 5.6,
    humidity: 99,
  );

  test('should return a current weather entity from the repository', () async {
    //arrange
    when(() =>
            mockCurrentWeatherRepository.getWeather(query: any(named: 'query')))
        .thenAnswer(
      (_) async => Right(tWeather),
    );

    //action
    final result = await usecase(const GetWeatherParams(tQuery));

    // assert
    expect(result, Right(tWeather));
    verify(() => mockCurrentWeatherRepository.getWeather(query: tQuery))
        .called(1);
  });
}
