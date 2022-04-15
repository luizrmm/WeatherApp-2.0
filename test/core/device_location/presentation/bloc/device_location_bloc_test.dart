import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_app/core/device_location/domain/entities/device_location.dart';
import 'package:weather_app/core/device_location/domain/errors/device_location_failures.dart';
import 'package:weather_app/core/device_location/domain/usecases/get_device_location_usecase.dart';
import 'package:weather_app/core/device_location/presentation/bloc/device_location_bloc.dart';

class MockGetDeviceLocationUseCase extends Mock
    implements GetDeviceLocationUseCase {}

void main() {
  late MockGetDeviceLocationUseCase mockGetDeviceLocationUseCase;
  late DeviceLocationBloc deviceLocationBloc;

  setUp(() {
    mockGetDeviceLocationUseCase = MockGetDeviceLocationUseCase();
    deviceLocationBloc =
        DeviceLocationBloc(deviceLocationUseCase: mockGetDeviceLocationUseCase);
    registerFallbackValue(GetDeviceLocationParams());
  });

  test('initialState should be DeviceLocationInitial', () {
    expect(deviceLocationBloc.state, equals(const DeviceLocationInitial()));
  });

  group('GET DEVICE LOCATION:', () {
    final tDeviceLocation = DeviceLocation(
      longitude: 43,
      latitude: 42,
      lastPositionTime: DateTime.parse('2022-02-08T21:21:00.000'),
      accuracy: 200,
    );

    const failure = LocationUnableToDetermineFailure();

    blocTest<DeviceLocationBloc, DeviceLocationState>(
      'should emit [loading, success] from get Device location use case',
      build: () {
        when(() => mockGetDeviceLocationUseCase(any()))
            .thenAnswer((_) async => Right(tDeviceLocation));
        return deviceLocationBloc;
      },
      seed: () => const DeviceLocationInitial(),
      act: (bloc) => bloc.add(const GetLocationEvent()),
      verify: (_) {
        verify(() => mockGetDeviceLocationUseCase(any())).called(1);
      },
      expect: () => [
        equals(LocationStateSuccess(tDeviceLocation)),
      ],
    );

    blocTest<DeviceLocationBloc, DeviceLocationState>(
      'should emit [loading, Error] from get Device location use case',
      build: () {
        when(() => mockGetDeviceLocationUseCase(any())).thenAnswer(
          (_) async => const Left(LocationPermissionForeverFailure()),
        );
        return deviceLocationBloc;
      },
      seed: () => const DeviceLocationInitial(),
      act: (bloc) => bloc.add(const GetLocationEvent()),
      verify: (_) {
        verify(() => mockGetDeviceLocationUseCase(any())).called(1);
      },
      expect: () => [
        equals(const LocationStateError(failure)),
      ],
    );
  });
}
