part of 'device_location_bloc.dart';

abstract class DeviceLocationState extends Equatable {
  const DeviceLocationState();

  @override
  List<Object> get props => [];
}

class DeviceLocationInitial extends DeviceLocationState {
  const DeviceLocationInitial();

  @override
  List<Object> get props => [];
}

class LocationStateSuccess extends DeviceLocationState {
  const LocationStateSuccess(this.location);
  final DeviceLocation location;
  @override
  List<Object> get props => [location];
}

class LocationStateInitial extends DeviceLocationState {
  const LocationStateInitial();
}

class LocationStateError extends DeviceLocationState {
  const LocationStateError(this.errorType);
  final Failure errorType;
}
