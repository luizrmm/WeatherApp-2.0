import 'package:get_it/get_it.dart';
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
  sl.registerFactory<WeatherBloc>(() => WeatherBloc(useCase: sl()));

  //UseCases
  sl.registerLazySingleton<GetWeatherUseCase>(
    () => GetWeatherUseCase(sl<WeatherRepository>()),
  );

  //Repositories
  sl.registerLazySingleton<WeatherRepository>(
    () => WeatherRepositoryImpl(datasource: sl<WeatherDatasource>()),
  );

  //DataSources
  sl.registerLazySingleton<WeatherDatasource>(
    () => WeatherRemoteDataSourceImpl(httpClient: sl<Client>()),
  );

  //External
  sl.registerLazySingleton<Client>(
    () => Client(),
  );
}
