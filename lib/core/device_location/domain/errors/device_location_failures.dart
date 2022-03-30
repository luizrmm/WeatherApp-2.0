import 'package:weather_app/core/errors/failures.dart';

class GetLocationFailure extends Failure {
  const GetLocationFailure();
  @override
  List<Object?> get props => [];
}

class LocationPermissionFailure extends Failure {
  const LocationPermissionFailure();
  @override
  List<Object?> get props => [];
}

class LocationPermissionForeverFailure extends Failure {
  const LocationPermissionForeverFailure();
  @override
  List<Object?> get props => [];
}

class LocationDisabledFailure extends Failure {
  const LocationDisabledFailure();
  @override
  List<Object?> get props => [];
}

class LocationUnableToDetermineFailure extends Failure {
  const LocationUnableToDetermineFailure();
  @override
  List<Object?> get props => [];
}
