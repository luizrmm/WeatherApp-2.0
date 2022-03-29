import 'package:flutter_test/flutter_test.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_app/core/device_location/data/models/device_location_model.dart';
import 'package:weather_app/core/device_location/domain/errors/device_location_exceptions.dart';
import 'package:weather_app/core/device_location/infra/device_location_datasource_impl.dart';

class MockGeolocator extends Mock implements GeolocatorPlatform {}

void main() {
  late MockGeolocator mockGeolocator;
  late DeviceLocationDatasourceImpl datasourceImpl;

  setUp(() {
    mockGeolocator = MockGeolocator();
    datasourceImpl = DeviceLocationDatasourceImpl(mockGeolocator);
  });

  final DeviceLocationModel tDeviceLocationModel = DeviceLocationModel(
    longitude: 43.0,
    latitude: 42.0,
    lastPositionTime: DateTime.parse("2022-02-08T21:21:00.000"),
    accuracy: 200,
  );

  const tPermissionWhileInUse = LocationPermission.whileInUse;
  const tPermissionAlways = LocationPermission.always;

  group("Service Location status:", () {
    test("should return true when servicelocation is enabled", () async {
      //arrange
      when(() => mockGeolocator.isLocationServiceEnabled()).thenAnswer(
        (invocation) async => Future.value(true),
      );
      //act
      final result = await datasourceImpl.serviceLocationStatus;
      //assert
      verify(() => mockGeolocator.isLocationServiceEnabled()).called(1);
      verifyNever(() => mockGeolocator.getCurrentPosition());
      verifyNever(() => mockGeolocator.checkPermission());
      expect(result, true);
    });

    test("should return false when servicelocation is disabled", () async {
      //arrange
      when(() => mockGeolocator.isLocationServiceEnabled()).thenAnswer(
        (invocation) async => Future.value(false),
      );
      //act
      final result = await datasourceImpl.serviceLocationStatus;
      //assert
      verify(() => mockGeolocator.isLocationServiceEnabled()).called(1);
      verifyNever(() => mockGeolocator.getCurrentPosition());
      verifyNever(() => mockGeolocator.checkPermission());
      expect(result, false);
    });
  });

  group("Checkpermission:", () {
    test(
        "should throw  [LocationPermissionUnableToDetermineException] user deny 2 times",
        () async {
      //arrange
      when(() => mockGeolocator.checkPermission()).thenAnswer(
          (invocation) async => LocationPermission.unableToDetermine);

      //act
      final call = datasourceImpl.checkLocationPermission;

      //assert

      expect(() => call(),
          throwsA(isA<LocationPermissionUnableToDetermineException>()));
    });
    test("should call the request permission if user deny 1 time", () async {
      //arrange
      when(() => mockGeolocator.checkPermission())
          .thenAnswer((invocation) async => LocationPermission.denied);
      when(() => mockGeolocator.requestPermission())
          .thenAnswer((_) async => LocationPermission.always);
      //act
      await datasourceImpl.checkLocationPermission();

      //assert
      verify(() => mockGeolocator.requestPermission()).called(1);
    });

    test("should throw  [LocationPermissionException] user deny 2 times",
        () async {
      //arrange
      when(() => mockGeolocator.checkPermission())
          .thenAnswer((invocation) async => LocationPermission.denied);
      when(() => mockGeolocator.requestPermission())
          .thenAnswer((_) async => LocationPermission.denied);
      //act
      final call = datasourceImpl.checkLocationPermission;

      //assert

      expect(() => call(), throwsA(isA<LocationPermissionException>()));
    });

    test(
        "should throw [LocationPermissionForeverException] if user deny forever",
        () async {
      //arrange
      when(() => mockGeolocator.checkPermission())
          .thenAnswer((invocation) async => LocationPermission.deniedForever);
      //act
      final call = datasourceImpl.checkLocationPermission;

      //assert
      expect(() => call(), throwsA(isA<LocationPermissionForeverException>()));
    });

    test(
        "should return [LocationPermission.always] if user accept location permission",
        () async {
      //arrange
      when(() => mockGeolocator.checkPermission())
          .thenAnswer((invocation) async => LocationPermission.always);
      //act
      final result = await datasourceImpl.checkLocationPermission();

      //assert
      expect(result, tPermissionAlways);
    });

    test("""should return  [LocationPermission.whileInUse] if user accept 
        location permission while app is in use""", () async {
      //arrange
      when(() => mockGeolocator.checkPermission())
          .thenAnswer((invocation) async => LocationPermission.whileInUse);
      //act
      final result = await datasourceImpl.checkLocationPermission();

      //assert
      expect(result, tPermissionWhileInUse);
    });
  });

  group("Get Position:", () {
    test("should return the current position when call is successfully",
        () async {
      //arrange
      when(() => mockGeolocator.getCurrentPosition())
          .thenAnswer((invocation) async => Position(
                longitude: 43.0,
                latitude: 42.0,
                timestamp: DateTime.parse("2022-02-08T21:21:00.000"),
                accuracy: 200,
                altitude: 0,
                heading: 0,
                speed: 0,
                speedAccuracy: 0,
              ));

      //act
      final result = await datasourceImpl.getLocation();

      //assert
      expect(result, equals(tDeviceLocationModel));
    });

    test("should throw a [GeolocationException] when call is fail", () async {
      //arrange
      when(() => mockGeolocator.getCurrentPosition()).thenThrow(Exception());

      //act
      final call = datasourceImpl.getLocation;

      //assert
      expect(() => call(), throwsA(isA<GetLocationException>()));
    });
  });
}
