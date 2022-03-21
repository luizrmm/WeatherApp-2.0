part of 'device_location_bloc.dart';

abstract class DeviceLocationState extends Equatable {
  const DeviceLocationState();

  @override
  List<Object> get props => [];
}

class DeviceLocationInitial extends DeviceLocationState {}

class LocationStateSuccess extends DeviceLocationState {
  final DeviceLocation location;

  const LocationStateSuccess(this.location);
  @override
  List<Object> get props => [location];
}

class LocationStateInitial extends DeviceLocationState {
  const LocationStateInitial();
}

class LocationStateLoading extends DeviceLocationState {
  const LocationStateLoading();
}

class LocationStateError extends DeviceLocationState {
  const LocationStateError();
}
