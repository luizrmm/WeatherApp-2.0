import 'package:dartz/dartz.dart';
import 'package:weather_app/core/device_location/domain/entities/device_location.dart';
import 'package:weather_app/core/device_location/domain/repositories/device_location_repository.dart';
import 'package:weather_app/core/errors/failures.dart';
import 'package:weather_app/core/usecases/usecase.dart';

class GetDeviceLocationUseCase
    implements UseCase<DeviceLocation, GetDeviceLocationParams> {
  final DeviceLocationRepository repository;

  GetDeviceLocationUseCase(this.repository);
  @override
  Future<Either<Failure, DeviceLocation>> call(GetDeviceLocationParams params) {
    return repository.getLocation();
  }
}

class GetDeviceLocationParams {}
