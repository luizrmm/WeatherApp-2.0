import 'package:geolocator/geolocator.dart';
import 'package:weather_app/core/device_location/data/datasources/device_location_datasource.dart';
import 'package:weather_app/core/device_location/data/models/device_location_model.dart';
import 'package:weather_app/core/device_location/domain/errors/device_location_exceptions.dart';

class DeviceLocationDatasourceImpl implements DeviceLocationDatasource {
  final GeolocatorPlatform geolocator;

  DeviceLocationDatasourceImpl(this.geolocator);
  @override
  Future<DeviceLocationModel> getLocation() async {
    try {
      final Position position = await geolocator.getCurrentPosition();
      final DeviceLocationModel deviceLocationModel = DeviceLocationModel(
          longitude: position.longitude,
          latitude: position.latitude,
          lastPositionTime: position.timestamp ?? DateTime.now(),
          accuracy: position.accuracy);
      return deviceLocationModel;
    } catch (e) {
      throw GetLocationException();
    }
  }

  @override
  Future<bool> get serviceLocationStatus =>
      geolocator.isLocationServiceEnabled();

  @override
  Future<bool> checkLocationPermission() {
    // TODO: implement checkLocationPermission
    throw UnimplementedError();
  }
}
