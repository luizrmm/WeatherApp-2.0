import 'package:weather_app/core/device_location/data/models/device_location_model.dart';
import 'package:weather_app/core/device_location/domain/errors/device_location_exceptions.dart';

abstract class DeviceLocationDatasource {
  /// calls the location external library
  /// and get the current gps position
  ///
  /// throws a [GetLocationException] for any exception.
  Future<DeviceLocationModel> getLocation();

  /// calls the location external library
  /// and get service status
  Future<bool> get serviceLocationStatus;

  ///calls the location external library
  ///and check gps device permission
  ///throws a [LocationPermissionException] for any exception
  Future<bool> checkLocationPermission();
}
