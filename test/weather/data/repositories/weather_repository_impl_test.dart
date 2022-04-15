import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_app/weather/data/datasources/weather_datasource.dart';
import 'package:weather_app/weather/data/models/weather_model.dart';
import 'package:weather_app/weather/data/repositories/weather_repository_impl.dart';
import 'package:weather_app/weather/domain/entities/weather.dart';
import 'package:weather_app/weather/domain/failures/weather_exceptions.dart';
import 'package:weather_app/weather/domain/failures/weather_failures.dart';

class MockWeatherDatasource extends Mock implements WeatherDatasource {}

void main() {
  late MockWeatherDatasource mockDatasource;
  late WeatherRepositoryImpl repositoryImpl;

  setUp(() {
    mockDatasource = MockWeatherDatasource();
    repositoryImpl = WeatherRepositoryImpl(datasource: mockDatasource);
  });

  const tWeatherModel = WeatherModel(
    location: LocationModel(
      name: 'Muzambinho',
      region: 'Minas Gerais',
      country: 'Brazil',
      localtime: '2022-02-08 21:21',
    ),
    current: CurrentModel(
      condition: ConditionModel(
        code: 1240,
        icon: '//cdn.weatherapi.com/weather/64x64/night/353.png',
        text: 'Light rain shower',
      ),
      lastUpdated: '2022-02-08 20:00',
      temperatureC: 19.3,
      temperatureF: 66.7,
      uv: 1,
      preciptationMM: 1.5,
      humidity: 97,
    ),
  );

  const tWeather = Weather(
    location: Location(
      name: 'Muzambinho',
      region: 'Minas Gerais',
      country: 'Brazil',
      localtime: '2022-02-08 21:21',
    ),
    current: Current(
      condition: Condition(
        code: 1240,
        icon: '//cdn.weatherapi.com/weather/64x64/night/353.png',
        text: 'Light rain shower',
      ),
      lastUpdated: '2022-02-08 20:00',
      temperatureC: 19.3,
      temperatureF: 66.7,
      uv: 1,
      preciptationMM: 1.5,
      humidity: 97,
    ),
  );

  const tQuery = 'Muzambinho';
  group('Get Weahter', () {
    test(
        'should return the remote data when call to the datasource is successfull',
        () async {
      //arrange
      when(() => mockDatasource.getWeather(any()))
          .thenAnswer((_) async => tWeatherModel);

      //action
      final result = await repositoryImpl.getWeather(query: tQuery);

      //assert
      verify(() => mockDatasource.getWeather(tQuery));
      expect(result, equals(const Right<dynamic, Weather>(tWeather)));
      verifyNoMoreInteractions(mockDatasource);
    });
  });

  test(
      'should throw a GetWeather Failure when the call to remote data source is unuccessful',
      () async {
    //arrange
    when(() => mockDatasource.getWeather(any()))
        .thenThrow(GetWeatherException());

    // actual
    final result = await repositoryImpl.getWeather(query: tQuery);

    // assert
    verify(() => mockDatasource.getWeather(tQuery));
    expect(
      result,
      equals(
        Left<dynamic, GetCurrentWeatherFailure>(GetCurrentWeatherFailure()),
      ),
    );
    verifyNoMoreInteractions(mockDatasource);
  });
}
