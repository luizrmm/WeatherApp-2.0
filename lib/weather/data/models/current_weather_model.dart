import 'package:json_annotation/json_annotation.dart';

part 'current_weather_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CurrentWeatherModel {
  final LocationModel location;
  final ConditionModel condition;
  final DateTime lastUpdate;
  final double temperatureC;
  final double temperatureF;
  final double uv;
  final double preciptationMM;
  final int humidity;

  const CurrentWeatherModel({
    required this.location,
    required this.condition,
    required this.lastUpdate,
    required this.temperatureC,
    required this.temperatureF,
    required this.uv,
    required this.preciptationMM,
    required this.humidity,
  });

  factory CurrentWeatherModel.fromJson(Map<String, dynamic> json) =>
      _$CurrentWeatherModelFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentWeatherModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ConditionModel {
  final String text;
  final String icon;
  final int code;
  const ConditionModel({
    required this.text,
    required this.icon,
    required this.code,
  });

  factory ConditionModel.fromJson(Map<String, dynamic> json) =>
      _$ConditionModelFromJson(json);

  Map<String, dynamic> toJson() => _$ConditionModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class LocationModel {
  final String name;
  final String region;
  final String country;
  final DateTime localtime;

  const LocationModel({
    required this.name,
    required this.region,
    required this.country,
    required this.localtime,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) =>
      _$LocationModelFromJson(json);

  Map<String, dynamic> toJson() => _$LocationModelToJson(this);
}
