import 'package:dartz/dartz.dart';
import 'package:weather_app/core/device_location/data/datasources/device_location_datasource.dart';
import 'package:weather_app/core/device_location/domain/entities/device_location.dart';
import 'package:weather_app/core/device_location/domain/errors/device_location_exceptions.dart';
import 'package:weather_app/core/device_location/domain/errors/device_location_failures.dart';
import 'package:weather_app/core/device_location/domain/repositories/device_location_repository.dart';
import 'package:weather_app/core/errors/failures.dart';

class DeviceLocationRepositoryImpl implements DeviceLocationRepository {
  final DeviceLocationDatasource datasource;

  DeviceLocationRepositoryImpl(this.datasource);
  @override
  Future<Either<Failure, DeviceLocation>> getLocation() async {
    if (await datasource.serviceLocationStatus) {
      try {
        await datasource.checkLocationPermission();
      } on LocationPermissionException {
        return const Left(LocationPermissionFailure());
      } on LocationPermissionForeverException {
        return const Left(LocationPermissionForeverFailure());
      } on LocationPermissionUnableToDetermineException {
        return const Left(LocationUnableToDetermineFailure());
      }
      try {
        return Right(await datasource.getLocation());
      } on GetLocationException {
        return const Left(GetLocationFailure());
      }
    } else {
      return const Left(LocationDisabledFailure());
    }
  }
}
