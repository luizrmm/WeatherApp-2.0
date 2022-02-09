// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherModel _$WeatherModelFromJson(Map<String, dynamic> json) => WeatherModel(
      location:
          LocationModel.fromJson(json['location'] as Map<String, dynamic>),
      current: CurrentModel.fromJson(json['current'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WeatherModelToJson(WeatherModel instance) =>
    <String, dynamic>{
      'location': instance.location.toJson(),
      'current': instance.current.toJson(),
    };

CurrentModel _$CurrentModelFromJson(Map<String, dynamic> json) => CurrentModel(
      condition:
          ConditionModel.fromJson(json['condition'] as Map<String, dynamic>),
      lastUpdated: json['last_updated'] as String,
      temperatureC: (json['temp_c'] as num).toDouble(),
      temperatureF: (json['temp_f'] as num).toDouble(),
      uv: (json['uv'] as num).toDouble(),
      preciptationMM: (json['precip_mm'] as num).toDouble(),
      humidity: json['humidity'] as int,
    );

Map<String, dynamic> _$CurrentModelToJson(CurrentModel instance) =>
    <String, dynamic>{
      'condition': instance.condition.toJson(),
      'last_updated': instance.lastUpdated,
      'temp_c': instance.temperatureC,
      'temp_f': instance.temperatureF,
      'uv': instance.uv,
      'precip_mm': instance.preciptationMM,
      'humidity': instance.humidity,
    };

ConditionModel _$ConditionModelFromJson(Map<String, dynamic> json) =>
    ConditionModel(
      text: json['text'] as String,
      icon: json['icon'] as String,
      code: json['code'] as int,
    );

Map<String, dynamic> _$ConditionModelToJson(ConditionModel instance) =>
    <String, dynamic>{
      'text': instance.text,
      'icon': instance.icon,
      'code': instance.code,
    };

LocationModel _$LocationModelFromJson(Map<String, dynamic> json) =>
    LocationModel(
      name: json['name'] as String,
      region: json['region'] as String,
      country: json['country'] as String,
      localtime: json['localtime'] as String,
    );

Map<String, dynamic> _$LocationModelToJson(LocationModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'region': instance.region,
      'country': instance.country,
      'localtime': instance.localtime,
    };
