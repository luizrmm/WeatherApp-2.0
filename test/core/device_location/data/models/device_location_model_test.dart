import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/core/device_location/data/models/device_location_model.dart';
import 'package:weather_app/core/device_location/domain/entities/device_location.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tDeviceLocationModel = DeviceLocationModel(
    longitude: 43.0,
    latitude: 42.0,
    lastPositionTime: DateTime.parse("2022-02-08 21:21"),
    accuracy: 200,
  );

  test("should be a DeviceLocation entity subclass", () {
    //assert
    expect(tDeviceLocationModel, isA<DeviceLocation>());
  });

  group("From json", () {
    test("should return a Device Location Model when json is valid", () {
      //arrange
      Map<String, dynamic> jsonMap =
          jsonDecode(fixture("device_location.json"));
      //act
      final result = DeviceLocationModel.fromJson(jsonMap);

      //assert
      expect(result, tDeviceLocationModel);
    });
  });

  group("ToJson", () {
    test("should return a json object containing a device location info", () {
      //act
      final result = tDeviceLocationModel.toJson();

      //assert
      final Map<String, dynamic> expectedMap = {
        "longitude": 43.0,
        "latitude": 42.0,
        "lastPositionTime": "2022-02-08T21:21:00.000",
        "accuracy": 200
      };
      expect(result, expectedMap);
    });
  });
}
