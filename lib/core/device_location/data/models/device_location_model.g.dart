// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_location_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeviceLocationModel _$DeviceLocationModelFromJson(Map<String, dynamic> json) =>
    DeviceLocationModel(
      longitude: (json['longitude'] as num).toDouble(),
      latitude: (json['latitude'] as num).toDouble(),
      lastPositionTime: DateTime.parse(json['lastPositionTime'] as String),
      accuracy: (json['accuracy'] as num).toDouble(),
    );

Map<String, dynamic> _$DeviceLocationModelToJson(
        DeviceLocationModel instance) =>
    <String, dynamic>{
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'accuracy': instance.accuracy,
      'lastPositionTime': instance.lastPositionTime.toIso8601String(),
    };
