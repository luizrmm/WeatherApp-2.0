import 'package:equatable/equatable.dart';

class Weather extends Equatable {
  final Location location;
  final Current current;

  const Weather({
    required this.location,
    required this.current,
  });

  @override
  List<Object> get props => [
        location,
        current,
      ];
}

class Current extends Equatable {
  final Condition condition;
  final String lastUpdated;
  final double temperatureC;
  final double temperatureF;
  final double uv;
  final double preciptationMM;
  final int humidity;

  int get tempCInteger => temperatureC.toInt();
  int get tempFInteger => temperatureF.toInt();

  const Current({
    required this.condition,
    required this.lastUpdated,
    required this.temperatureC,
    required this.temperatureF,
    required this.uv,
    required this.preciptationMM,
    required this.humidity,
  });

  @override
  List<Object?> get props => [
        condition,
        lastUpdated,
        temperatureC,
        temperatureF,
        uv,
        preciptationMM,
        humidity,
      ];
}

class Location extends Equatable {
  final String name;
  final String region;
  final String country;
  final String localtime;

  const Location({
    required this.name,
    required this.region,
    required this.country,
    required this.localtime,
  });

  @override
  List<Object> get props => [
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
  List<Object> get props => [
        text,
        code,
        icon,
      ];
}
