import 'package:weather_app/weather/data/models/weather_model.dart';
import 'package:weather_app/weather/domain/entities/weather.dart';

class WeatherMapper {
  static Weather toEntity(WeatherModel model) {
    return Weather(
      location: _LocationMapper.toEntity(model.location),
      current: _CurrentMapper.toEntity(model.current),
    );
  }

  static WeatherModel toModel(Weather entity) {
    return WeatherModel(
      location: _LocationMapper.toModel(entity.location),
      current: _CurrentMapper.toModel(entity.current),
    );
  }
}

class _CurrentMapper {
  static Current toEntity(CurrentModel model) {
    return Current(
      condition: _ConditionMapper.toEntity(model.condition),
      lastUpdated: model.lastUpdated,
      temperatureC: model.temperatureC,
      temperatureF: model.temperatureF,
      uv: model.uv,
      preciptationMM: model.preciptationMM,
      humidity: model.humidity,
    );
  }

  static CurrentModel toModel(Current entity) {
    return CurrentModel(
      condition: _ConditionMapper.toModel(entity.condition),
      lastUpdated: entity.lastUpdated,
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
      localtime: entity.localtime,
    );
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
