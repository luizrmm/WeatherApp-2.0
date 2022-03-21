import 'package:geolocator/geolocator.dart';
import 'package:get_it/get_it.dart';
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
import 'package:http/http.dart' show Client;

final sl = GetIt.instance;

Future<void> init() async {
  //Blocs
  sl.registerFactory<WeatherBloc>(() => WeatherBloc(
        useCase: sl(),
      ));
  sl.registerFactory<DeviceLocationBloc>(
    () => DeviceLocationBloc(
      deviceLocationUseCase: sl<GetDeviceLocationUseCase>(),
    ),
  );

  //UseCases
  sl.registerLazySingleton<GetWeatherUseCase>(
    () => GetWeatherUseCase(sl<WeatherRepository>()),
  );
  sl.registerLazySingleton<GetDeviceLocationUseCase>(
    () => GetDeviceLocationUseCase(sl<DeviceLocationRepository>()),
  );

  //Repositories
  sl.registerLazySingleton<WeatherRepository>(
    () => WeatherRepositoryImpl(datasource: sl<WeatherDatasource>()),
  );
  sl.registerLazySingleton<DeviceLocationRepository>(
      () => DeviceLocationRepositoryImpl(sl<DeviceLocationDatasource>()));

  //DataSources
  sl.registerLazySingleton<WeatherDatasource>(
    () => WeatherRemoteDataSourceImpl(httpClient: sl<Client>()),
  );

  //External
  sl.registerLazySingleton<Client>(
    () => Client(),
  );
  final geolocator = GeolocatorPlatform.instance;
  sl.registerLazySingleton(() => geolocator);

  sl.registerLazySingleton<DeviceLocationDatasource>(
    () => DeviceLocationDatasourceImpl(sl()),
  );
}
