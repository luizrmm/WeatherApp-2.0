import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_app/core/device_location/domain/entities/device_location.dart';
import 'package:weather_app/core/device_location/domain/repositories/device_location_repository.dart';
import 'package:weather_app/core/device_location/domain/usecases/get_device_location_usecase.dart';

class MockDeviceLocationRepository extends Mock
    implements DeviceLocationRepository {}

void main() {
  late MockDeviceLocationRepository mockDeviceLocationRepository;
  late GetDeviceLocationUseCase useCase;

  setUp(() {
    mockDeviceLocationRepository = MockDeviceLocationRepository();
    useCase = GetDeviceLocationUseCase(mockDeviceLocationRepository);
  });

  final tDeviceLocation = DeviceLocation(
    longitude: 43,
    latitude: 42,
    lastPositionTime: DateTime.parse('2022-02-08T21:21:00.000'),
    accuracy: 200,
  );

  test('should return device location from the repository', () async {
    //arrange
    when(() => mockDeviceLocationRepository.getLocation())
        .thenAnswer((invocation) async => Right(tDeviceLocation));

    //act
    final result = await useCase(GetDeviceLocationParams());

    //assert
    verify(() => mockDeviceLocationRepository.getLocation()).called(1);
    expect(result, equals(Right(tDeviceLocation)));
  });
}
