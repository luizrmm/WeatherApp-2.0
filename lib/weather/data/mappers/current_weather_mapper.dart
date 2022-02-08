import 'package:weather_app/weather/data/models/current_weather_model.dart';
import 'package:weather_app/weather/domain/entities/current_weather.dart';

class CurrentWeatherMapper {
  static CurrentWeather toEntity(CurrentWeatherModel model) {
    return CurrentWeather(
      location: _LocationMapper.toEntity(model.location),
      condition: _ConditionMapper.toEntity(model.condition),
      lastUpdate: model.lastUpdate,
      temperatureC: model.temperatureC,
      temperatureF: model.temperatureF,
      uv: model.uv,
      preciptationMM: model.preciptationMM,
      humidity: model.humidity,
    );
  }

  static CurrentWeatherModel toModel(CurrentWeather entity) {
    return CurrentWeatherModel(
      location: _LocationMapper.toModel(entity.location),
      condition: _ConditionMapper.toModel(entity.condition),
      lastUpdate: entity.lastUpdate,
      temperatureC: entity.temperatureC,
      temperatureF: entity.temperatureF,
      uv: entity.uv,
      preciptationMM: entity.preciptationMM,
      humidity: entity.humidity,
    );
  }
}

class _LocationMapper {
  static Location toEntity(LocationModel model) {
    return Location(
      name: model.name,
      region: model.region,
      country: model.country,
      localtime: model.localtime,
    );
  }

  static LocationModel toModel(Location entity) {
    return LocationModel(
        name: entity.name,
        region: entity.region,
        country: entity.country,
        localtime: entity.localtime);
  }
}

class _ConditionMapper {
  static Condition toEntity(ConditionModel model) {
    return Condition(
      text: model.text,
      icon: model.icon,
      code: model.code,
    );
  }

  static ConditionModel toModel(Condition entity) {
    return ConditionModel(
      text: entity.text,
      icon: entity.icon,
      code: entity.code,
    );
  }
}
