import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_app/weather/domain/entities/weather.dart';
import 'package:weather_app/weather/domain/failures/weather_failures.dart';
import 'package:weather_app/weather/domain/usecases/get_weather_usecase.dart';
import 'package:weather_app/weather/presentation/bloc/weather_bloc.dart';

class MockGetWeatherUseCase extends Mock implements GetWeatherUseCase {}

void main() {
  late MockGetWeatherUseCase mockusecase;
  late WeatherBloc weatherBloc;
  const tQuery = 'Muzambinho';

  setUp(() {
    mockusecase = MockGetWeatherUseCase();
    weatherBloc = WeatherBloc(useCase: mockusecase);
    registerFallbackValue(const GetWeatherParams(tQuery));
  });

  test('initialState should be WeaherInitial', () {
    expect(weatherBloc.state, equals(const WeatherInitial()));
  });

  group('Get Wather', () {
    const tWeather = Weather(
      location: Location(
        name: 'Muzambinho',
        region: 'Minas Gerais',
        country: 'Brazil',
        localtime: '2022-02-07 23:39',
      ),
      current: Current(
        condition: Condition(
          code: 1189,
          text: 'Moderate rain',
          icon: '//cdn.weatherapi.com/weather/64x64/night/302.png',
        ),
        lastUpdated: '2022-02-07 23:30',
        temperatureC: 18.6,
        temperatureF: 65.5,
        uv: 1,
        preciptationMM: 5.6,
        humidity: 99,
      ),
    );

    blocTest<WeatherBloc, WeatherState>(
      'should emit[loading, success] from get wather use case',
      build: () {
        when(() => mockusecase(any()))
            .thenAnswer((_) async => const Right(tWeather));
        return weatherBloc;
      },
      act: (bloc) => bloc.add(const GetWeatherEvent(query: tQuery)),
      expect: () => [
        const WeatherLoading(),
        const WeatherSuccess(tWeather),
      ],
    );

    blocTest<WeatherBloc, WeatherState>(
      'should emit[loading, error] from get wather use case',
      build: () {
        when(() => mockusecase(any()))
            .thenAnswer((_) async => Left(GetCurrentWeatherFailure()));
        return weatherBloc;
      },
      act: (bloc) => bloc.add(const GetWeatherEvent(query: tQuery)),
      expect: () => [
        const WeatherLoading(),
        const WeatherError(GET_WEATHER_MESSAGE_ERROR),
      ],
    );
  });
}
