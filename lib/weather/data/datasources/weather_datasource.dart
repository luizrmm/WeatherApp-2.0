import 'package:weather_app/weather/data/models/weather_model.dart';

abstract class WeatherDatasource {
  /// calls the authentication endpoint
  ///
  /// throws a [GetWeatherException] for all error codes.
  Future<WeatherModel> getWeather(String query);
}
