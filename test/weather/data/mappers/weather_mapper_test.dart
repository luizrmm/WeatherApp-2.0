import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/weather/data/mappers/weather_mapper.dart';
import 'package:weather_app/weather/data/models/weather_model.dart';
import 'package:weather_app/weather/domain/entities/weather.dart';

void main() {
  const tCurrentWeatherModel = WeatherModel(
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

  const tCurrentWeather = Weather(
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

  group('To Model', () {
    test('should return a valid model when the input is a current weather', () {
      // act
      final result = WeatherMapper.toModel(tCurrentWeather);
      // assert
      expect(result, tCurrentWeatherModel);
    });
  });

  group('To Entity', () {
    test(
      'should return a valid Weather when the input is a WeatherModel',
      () {
        // act
        final result = WeatherMapper.toEntity(tCurrentWeatherModel);
        // assert
        expect(result, tCurrentWeather);
      },
    );
  });
}
