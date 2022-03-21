import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/core/device_location/domain/entities/device_location.dart';
import 'package:weather_app/core/device_location/domain/usecases/get_device_location_usecase.dart';

part 'device_location_event.dart';
part 'device_location_state.dart';

class DeviceLocationBloc
    extends Bloc<DeviceLocationEvent, DeviceLocationState> {
  final GetDeviceLocationUseCase deviceLocationUseCase;
  DeviceLocationBloc({required this.deviceLocationUseCase})
      : super(DeviceLocationInitial()) {
    on<GetLocationEvent>(_getLocation);
  }
  Future<void> _getLocation(
      GetLocationEvent event, Emitter<DeviceLocationState> emit) async {
    emit(const LocationStateLoading());
    final result = await deviceLocationUseCase(GetDeviceLocationParams());
    result.fold(
      (failure) => emit(const LocationStateError()),
      (succes) => emit(LocationStateSuccess(succes)),
    );
  }
}