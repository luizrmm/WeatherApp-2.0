import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/weather/data/models/weather_model.dart';

import '../../../fixtures/fixture_reader.dart';

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

  group('fromJson', () {
    test('should return a valid model when the json is a current weather', () {
      // arrange
      final jsonMap =
          jsonDecode(fixture('current_weather.json')) as Map<String, dynamic>;
      // act
      final result = WeatherModel.fromJson(jsonMap);
      // assert
      expect(result, tCurrentWeatherModel);
    });
  });

  group('toJson', () {
    test(
      'should return a JSON map containing the proper data',
      () {
        // act
        final result = tCurrentWeatherModel.toJson();
        // assert
        final expectedMap =
            jsonDecode(fixture('current_weather.json')) as Map<String, dynamic>;
        expect(result, expectedMap);
      },
    );
  });
}
