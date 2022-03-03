import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/core/device_location/domain/entities/device_location.dart';
part 'device_location_model.g.dart';

@JsonSerializable()
class DeviceLocationModel extends DeviceLocation {
  const DeviceLocationModel(
      {required double longitude,
      required double latitude,
      required DateTime lastPositionTime,
      required double accuracy})
      : super(
            longitude: longitude,
            latitude: latitude,
            lastPositionTime: lastPositionTime,
            accuracy: accuracy);

  factory DeviceLocationModel.fromJson(Map<String, dynamic> json) =>
      _$DeviceLocationModelFromJson(json);

  Map<String, dynamic> toJson() => _$DeviceLocationModelToJson(this);
}
