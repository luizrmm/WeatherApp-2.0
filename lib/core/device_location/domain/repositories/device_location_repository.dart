import 'package:dartz/dartz.dart';
import 'package:weather_app/core/device_location/domain/entities/device_location.dart';
import 'package:weather_app/core/errors/failures.dart';

abstract class DeviceLocationRepository {
  Future<Either<Failure, DeviceLocation>> getLocation();
}
