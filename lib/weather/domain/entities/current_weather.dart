import 'package:equatable/equatable.dart';

class CurrentWeather extends Equatable {
  final Location location;
  final Condition condition;
  final DateTime lastUpdate;
  final double temperatureC;
  final double temperatureF;
  final double uv;
  final double preciptationMM;
  final int humidity;

  const CurrentWeather({
    required this.location,
    required this.condition,
    required this.lastUpdate,
    required this.temperatureC,
    required this.temperatureF,
    required this.uv,
    required this.preciptationMM,
    required this.humidity,
  });

  @override
  List<Object?> get props => throw UnimplementedError();
}

class Location extends Equatable {
  final String name;
  final String region;
  final String country;
  final DateTime localtime;

  const Location({
    required this.name,
    required this.region,
    required this.country,
    required this.localtime,
  });

  @override
  List<Object?> get props => [
        name,
        region,
        country,
        localtime,
      ];
}

class Condition extends Equatable {
  final String text;
  final String icon;
  final int code;
  const Condition({
    required this.text,
    required this.icon,
    required this.code,
  });
  @override
  List<Object?> get props => [
        text,
        code,
        icon,
      ];
}
