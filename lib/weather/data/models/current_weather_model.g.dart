// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_weather_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentWeatherModel _$CurrentWeatherModelFromJson(Map<String, dynamic> json) =>
    CurrentWeatherModel(
      location:
          LocationModel.fromJson(json['location'] as Map<String, dynamic>),
      condition:
          ConditionModel.fromJson(json['condition'] as Map<String, dynamic>),
      lastUpdate: DateTime.parse(json['lastUpdate'] as String),
      temperatureC: (json['temperatureC'] as num).toDouble(),
      temperatureF: (json['temperatureF'] as num).toDouble(),
      uv: (json['uv'] as num).toDouble(),
      preciptationMM: (json['preciptationMM'] as num).toDouble(),
      humidity: json['humidity'] as int,
    );

Map<String, dynamic> _$CurrentWeatherModelToJson(
        CurrentWeatherModel instance) =>
    <String, dynamic>{
      'location': instance.location.toJson(),
      'condition': instance.condition.toJson(),
      'lastUpdate': instance.lastUpdate.toIso8601String(),
      'temperatureC': instance.temperatureC,
      'temperatureF': instance.temperatureF,
      'uv': instance.uv,
      'preciptationMM': instance.preciptationMM,
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
      localtime: DateTime.parse(json['localtime'] as String),
    );

Map<String, dynamic> _$LocationModelToJson(LocationModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'region': instance.region,
      'country': instance.country,
      'localtime': instance.localtime.toIso8601String(),
    };
