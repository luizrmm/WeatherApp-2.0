import 'package:equatable/equatable.dart';

class DeviceLocation extends Equatable {
  const DeviceLocation({
    required this.longitude,
    required this.latitude,
    required this.lastPositionTime,
    required this.accuracy,
  });
  final double longitude;
  final double latitude;
  final double accuracy;
  final DateTime lastPositionTime;

  @override
  List<Object?> get props => [
        longitude,
        latitude,
        lastPositionTime,
        accuracy,
      ];
}
