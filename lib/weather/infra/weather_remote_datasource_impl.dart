import 'dart:convert';

import 'package:weather_app/api_key.dart';
import 'package:weather_app/weather/data/datasources/weather_datasource.dart';
import 'package:weather_app/weather/data/models/weather_model.dart';
import 'package:http/http.dart' show Client;
import 'package:weather_app/weather/domain/failures/weather_exceptions.dart';

class WeatherRemoteDataSourceImpl implements WeatherDatasource {
  final Client httpClient;

  WeatherRemoteDataSourceImpl({required this.httpClient});
  @override
  Future<WeatherModel> getWeather(String query) async {
    final response = await httpClient.get(
      Uri.parse(
        'http://api.weatherapi.com/v1/current.json?key=$apiKey&q=$query&aqi=no',
      ),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    await Future.delayed(const Duration(seconds: 3));
    if (response.statusCode == 200) {
      return WeatherModel.fromJson(jsonDecode(response.body));
    } else {
      throw GetWeatherException();
    }
  }
}
