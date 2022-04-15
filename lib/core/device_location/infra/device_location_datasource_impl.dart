import 'package:geolocator/geolocator.dart';
import 'package:weather_app/core/device_location/data/datasources/device_location_datasource.dart';
import 'package:weather_app/core/device_location/data/models/device_location_model.dart';
import 'package:weather_app/core/device_location/domain/errors/device_location_exceptions.dart';

class DeviceLocationDatasourceImpl implements DeviceLocationDatasource {
  DeviceLocationDatasourceImpl(this.geolocator);
  final GeolocatorPlatform geolocator;

  @override
  Future<DeviceLocationModel> getLocation() async {
    try {
      final position = await geolocator.getCurrentPosition();
      final deviceLocationModel = DeviceLocationModel(
        longitude: position.longitude,
        latitude: position.latitude,
        lastPositionTime: position.timestamp ?? DateTime.now(),
        accuracy: position.accuracy,
      );
      return deviceLocationModel;
    } catch (e) {
      throw GetLocationException();
    }
  }

  @override
  Future<bool> get serviceLocationStatus =>
      geolocator.isLocationServiceEnabled();

  @override
  Future<LocationPermission> checkLocationPermission() async {
    final permission = await geolocator.checkPermission();
    if (permission == LocationPermission.unableToDetermine) {
      throw LocationPermissionUnableToDetermineException();
    } else if (permission == LocationPermission.denied) {
      return _requestLocationPermission();
    } else if (permission == LocationPermission.deniedForever) {
      throw LocationPermissionForeverException();
    } else {
      return permission;
    }
  }

  Future<LocationPermission> _requestLocationPermission() async {
    final permission = await geolocator.requestPermission();
    switch (permission) {
      case LocationPermission.denied:
        throw LocationPermissionException();
      case LocationPermission.deniedForever:
        throw LocationPermissionForeverException();
      case LocationPermission.whileInUse:
        return permission;
      case LocationPermission.always:
        return permission;
      case LocationPermission.unableToDetermine:
        return permission;
    }
  }
}
