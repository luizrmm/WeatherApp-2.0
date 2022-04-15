import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'weather_model.g.dart';

@JsonSerializable(explicitToJson: true)
class WeatherModel extends Equatable {
  const WeatherModel({
    required this.location,
    required this.current,
  });
  factory WeatherModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherModelFromJson(json);

  final LocationModel location;
  final CurrentModel current;

  Map<String, dynamic> toJson() => _$WeatherModelToJson(this);

  @override
  List<Object?> get props => [location, current];
}

@JsonSerializable(explicitToJson: true)
class CurrentModel extends Equatable {
  const CurrentModel({
    required this.condition,
    required this.lastUpdated,
    required this.temperatureC,
    required this.temperatureF,
    required this.uv,
    required this.preciptationMM,
    required this.humidity,
  });

  factory CurrentModel.fromJson(Map<String, dynamic> json) =>
      _$CurrentModelFromJson(json);

  @JsonKey(name: 'condition')
  final ConditionModel condition;
  @JsonKey(name: 'last_updated')
  final String lastUpdated;
  @JsonKey(name: 'temp_c')
  final double temperatureC;
  @JsonKey(name: 'temp_f')
  final double temperatureF;
  @JsonKey(name: 'uv')
  final double uv;
  @JsonKey(name: 'precip_mm')
  final double preciptationMM;
  @JsonKey(name: 'humidity')
  final int humidity;

  Map<String, dynamic> toJson() => _$CurrentModelToJson(this);

  @override
  List<Object?> get props => [
        condition,
        lastUpdated,
        temperatureC,
        temperatureF,
        uv,
        preciptationMM,
        humidity,
      ];
}

@JsonSerializable(explicitToJson: true)
class ConditionModel extends Equatable {
  const ConditionModel({
    required this.text,
    required this.icon,
    required this.code,
  });

  factory ConditionModel.fromJson(Map<String, dynamic> json) =>
      _$ConditionModelFromJson(json);

  final String text;
  final String icon;
  final int code;

  Map<String, dynamic> toJson() => _$ConditionModelToJson(this);

  @override
  List<Object?> get props => [text, icon, code];
}

@JsonSerializable(explicitToJson: true)
class LocationModel extends Equatable {
  const LocationModel({
    required this.name,
    required this.region,
    required this.country,
    required this.localtime,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) =>
      _$LocationModelFromJson(json);
  final String name;
  final String region;
  final String country;
  final String localtime;

  Map<String, dynamic> toJson() => _$LocationModelToJson(this);

  @override
  List<Object?> get props => [name, region, country, localtime];
}
