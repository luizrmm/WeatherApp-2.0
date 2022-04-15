import 'dart:convert';

import 'package:http/http.dart' show Client;
import 'package:weather_app/api_key.dart';
import 'package:weather_app/weather/data/datasources/weather_datasource.dart';
import 'package:weather_app/weather/data/models/weather_model.dart';
import 'package:weather_app/weather/domain/failures/weather_exceptions.dart';

class WeatherRemoteDataSourceImpl implements WeatherDatasource {
  WeatherRemoteDataSourceImpl({required Client httpClient})
      : _httpClient = httpClient;
  final Client _httpClient;

  @override
  Future<WeatherModel> getWeather(String query) async {
    final response = await _httpClient.get(
      Uri.parse(
        'http://api.weatherapi.com/v1/current.json?key=$apiKey&q=$query&aqi=no',
      ),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return WeatherModel.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw GetWeatherException();
    }
  }
}
