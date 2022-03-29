import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_app/core/device_location/data/datasources/device_location_datasource.dart';
import 'package:weather_app/core/device_location/data/models/device_location_model.dart';
import 'package:weather_app/core/device_location/data/repositories/device_location_repository_impl.dart';
import 'package:weather_app/core/device_location/domain/errors/device_location_exceptions.dart';
import 'package:weather_app/core/device_location/domain/errors/device_location_failures.dart';

class MockDeviceLocationDataSource extends Mock
    implements DeviceLocationDatasource {}

void main() {
  late MockDeviceLocationDataSource mockDataSource;
  late DeviceLocationRepositoryImpl repositoryImpl;

  setUp(() {
    mockDataSource = MockDeviceLocationDataSource();
    repositoryImpl = DeviceLocationRepositoryImpl(mockDataSource);
  });

  final DeviceLocationModel tDeviceLocationModel = DeviceLocationModel(
    longitude: 43.0,
    latitude: 42.0,
    lastPositionTime: DateTime.parse("2022-02-08T21:21:00.000"),
    accuracy: 200,
  );

  group("Device location repository GetLocation:", () {
    test(
        "should return device location entity when call to datasource is successfully",
        () async {
      //arrange
      when(() => mockDataSource.serviceLocationStatus).thenAnswer(
        (invocation) async => true,
      );
      when(() => mockDataSource.checkLocationPermission())
          .thenAnswer((invocation) async => LocationPermission.always);
      when(() => mockDataSource.getLocation())
          .thenAnswer((invocation) async => tDeviceLocationModel);

      //act
      final result = await repositoryImpl.getLocation();

      //assert
      verify(() => mockDataSource.serviceLocationStatus);
      verify(() => mockDataSource.checkLocationPermission());
      expect(result, Right(tDeviceLocationModel));
    });

    test("should return location disabled failure when location is disabled",
        () async {
      //arrange
      when(() => mockDataSource.serviceLocationStatus).thenAnswer(
        (invocation) async => false,
      );
      when(() => mockDataSource.checkLocationPermission())
          .thenAnswer((invocation) async => LocationPermission.always);
      when(() => mockDataSource.getLocation())
          .thenAnswer((invocation) async => tDeviceLocationModel);

      //act
      final result = await repositoryImpl.getLocation();

      //assert
      verify(() => mockDataSource.serviceLocationStatus);
      verifyNever(() => mockDataSource.checkLocationPermission());
      expect(
          result,
          Left(
            LocationDisabledFailure(),
          ));
    });

    test(
        "should return location permission failure when location permission is denied one time",
        () async {
      //arrange
      when(() => mockDataSource.serviceLocationStatus).thenAnswer(
        (invocation) async => true,
      );
      when(() => mockDataSource.checkLocationPermission())
          .thenThrow(LocationPermissionException());
      when(() => mockDataSource.getLocation())
          .thenAnswer((invocation) async => tDeviceLocationModel);

      //act
      final result = await repositoryImpl.getLocation();

      //assert
      verify(() => mockDataSource.serviceLocationStatus);
      verify(() => mockDataSource.checkLocationPermission());
      expect(
        result,
        Left(
          LocationPermissionFailure(),
        ),
      );
    });

    test(
        "should return location permission forever failure when location permission is denied for ever",
        () async {
      //arrange
      when(() => mockDataSource.serviceLocationStatus).thenAnswer(
        (invocation) async => true,
      );
      when(() => mockDataSource.checkLocationPermission())
          .thenThrow(LocationPermissionForeverException());
      when(() => mockDataSource.getLocation())
          .thenAnswer((invocation) async => tDeviceLocationModel);

      //act
      final result = await repositoryImpl.getLocation();

      //assert
      verify(() => mockDataSource.serviceLocationStatus);
      verify(() => mockDataSource.checkLocationPermission());
      expect(
        result,
        Left(
          LocationPermissionForeverFailure(),
        ),
      );
    });
  });
}
