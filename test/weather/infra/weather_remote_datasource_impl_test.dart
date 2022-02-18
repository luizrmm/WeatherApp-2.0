import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart' show Client, Response;
import 'package:weather_app/api_key.dart';
import 'package:weather_app/weather/data/models/weather_model.dart';
import 'package:weather_app/weather/domain/failures/weather_exceptions.dart';
import 'package:weather_app/weather/infra/weather_remote_datasource_impl.dart';

import '../../fixtures/fixture_reader.dart';

class MockHttpClient extends Mock implements Client {}

void main() {
  const String tQuery = 'Muzambinho';
  late MockHttpClient mockHttpClient;
  late WeatherRemoteDataSourceImpl dataSourceImpl;

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSourceImpl = WeatherRemoteDataSourceImpl(httpClient: mockHttpClient);
    registerFallbackValue(
      Uri.parse(
          'http://api.weatherapi.com/v1/current.json?key=$apiKey&q=$tQuery&aqi=no'),
    );
  });

  void setUpHttpClientSuccess() {
    when(() => mockHttpClient.get(
              any(),
              headers: any(named: 'headers'),
            ))
        .thenAnswer(
            (_) async => Response(fixture('current_weather.json'), 200));
  }

  group('Get weather', () {
    final tWeatherModel =
        WeatherModel.fromJson(jsonDecode(fixture('current_weather.json')));

    test('should perform a get request on a url with the query information',
        () {
      //arrange
      setUpHttpClientSuccess();

      //action
      dataSourceImpl.getWeather(tQuery);

      verify(() => mockHttpClient.get(
            Uri.parse(
                'http://api.weatherapi.com/v1/current.json?key=91fbd82b450b4a448af15236220802&q=$tQuery&aqi=no'),
            headers: {
              'Content-Type': 'application/json',
            },
          ));
    });

    test('should return a Weather model when the response code is 200(success)',
        () async {
      // arrange
      setUpHttpClientSuccess();
      // act
      final result = await dataSourceImpl.getWeather(tQuery);

      // assert
      expect(result, equals(tWeatherModel));
    });

    test('should throw a GetWeatherException when request url fails', () async {
      //arrange
      when(() => mockHttpClient.get(any(), headers: any(named: 'headers')))
          .thenAnswer(
        (_) async => Response('Something wrong', 400),
      );
      //action
      final call = dataSourceImpl.getWeather;

      //assert
      expect(
        () => call(tQuery),
        throwsA(isA<GetWeatherException>()),
      );
    });
  });
}
