import 'package:equatable/equatable.dart';

class DeviceLocation extends Equatable {
  final double longitude;
  final double latitude;
  final double accuracy;
  final DateTime lastPositionTime;

  const DeviceLocation({
    required this.longitude,
    required this.latitude,
    required this.lastPositionTime,
    required this.accuracy,
  });

  @override
  List<Object?> get props => [
        longitude,
        latitude,
        lastPositionTime,
      ];
}
