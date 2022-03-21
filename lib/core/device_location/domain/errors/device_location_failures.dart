import 'package:weather_app/core/errors/failures.dart';

class GetLocationFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class LocationPermissionFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class LocationPermissionForeverFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class LocationDisabledFailure extends Failure {
  @override
  List<Object?> get props => [];
}
