part of 'device_location_bloc.dart';

abstract class DeviceLocationEvent extends Equatable {
  const DeviceLocationEvent();

  @override
  List<Object> get props => [];
}

class GetLocationEvent extends DeviceLocationEvent {
  const GetLocationEvent();
}
