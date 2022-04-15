import 'package:equatable/equatable.dart';

class Weather extends Equatable {
  const Weather({
    required this.location,
    required this.current,
  });
  final Location location;
  final Current current;

  @override
  List<Object> get props => [
        location,
        current,
      ];
}

class Current extends Equatable {
  const Current({
    required this.condition,
    required this.lastUpdated,
    required this.temperatureC,
    required this.temperatureF,
    required this.uv,
    required this.preciptationMM,
    required this.humidity,
  });
  final Condition condition;
  final String lastUpdated;
  final double temperatureC;
  final double temperatureF;
  final double uv;
  final double preciptationMM;
  final int humidity;
  int get tempCInteger => temperatureC.toInt();
  int get tempFInteger => temperatureF.toInt();

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
  const Location({
    required this.name,
    required this.region,
    required this.country,
    required this.localtime,
  });
  final String name;
  final String region;
  final String country;
  final String localtime;

  @override
  List<Object> get props => [
        name,
        region,
        country,
        localtime,
      ];
}

class Condition extends Equatable {
  const Condition({
    required this.text,
    required this.icon,
    required this.code,
  });

  final String text;
  final String icon;
  final int code;

  @override
  List<Object> get props => [
        text,
        code,
        icon,
      ];
}
