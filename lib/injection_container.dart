import 'package:geolocator/geolocator.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' show Client;
import 'package:weather_app/core/device_location/data/datasources/device_location_datasource.dart';
import 'package:weather_app/core/device_location/data/repositories/device_location_repository_impl.dart';
import 'package:weather_app/core/device_location/domain/repositories/device_location_repository.dart';
import 'package:weather_app/core/device_location/domain/usecases/get_device_location_usecase.dart';
import 'package:weather_app/core/device_location/infra/device_location_datasource_impl.dart';
import 'package:weather_app/core/device_location/presentation/bloc/device_location_bloc.dart';
import 'package:weather_app/weather/data/datasources/weather_datasource.dart';
import 'package:weather_app/weather/data/repositories/weather_repository_impl.dart';
import 'package:weather_app/weather/domain/repositories/weather_repository.dart';
import 'package:weather_app/weather/domain/usecases/get_weather_usecase.dart';
import 'package:weather_app/weather/infra/weather_remote_datasource_impl.dart';
import 'package:weather_app/weather/presentation/bloc/weather_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  final geolocator = GeolocatorPlatform.instance;

  sl
    ..registerFactory<WeatherBloc>(
      () => WeatherBloc(
        useCase: sl(),
      ),
    )
    ..registerFactory<DeviceLocationBloc>(
      () => DeviceLocationBloc(
        deviceLocationUseCase: sl<GetDeviceLocationUseCase>(),
      ),
    )
    ..registerLazySingleton<GetWeatherUseCase>(
      () => GetWeatherUseCase(sl<WeatherRepository>()),
    )
    ..registerLazySingleton<GetDeviceLocationUseCase>(
      () => GetDeviceLocationUseCase(sl<DeviceLocationRepository>()),
    )
    ..registerLazySingleton<WeatherRepository>(
      () => WeatherRepositoryImpl(datasource: sl<WeatherDatasource>()),
    )
    ..registerLazySingleton<DeviceLocationRepository>(
      () => DeviceLocationRepositoryImpl(sl<DeviceLocationDatasource>()),
    )
    ..registerLazySingleton<WeatherDatasource>(
      () => WeatherRemoteDataSourceImpl(httpClient: sl<Client>()),
    )
    ..registerLazySingleton<Client>(
      Client.new,
    )
    ..registerLazySingleton(() => geolocator)
    ..registerLazySingleton<DeviceLocationDatasource>(
      () => DeviceLocationDatasourceImpl(sl()),
    );
}
