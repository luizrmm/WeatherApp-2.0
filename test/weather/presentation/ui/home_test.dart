import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_app/core/device_location/domain/entities/device_location.dart';
import 'package:weather_app/core/device_location/domain/errors/device_location_failures.dart';
import 'package:weather_app/core/device_location/presentation/bloc/device_location_bloc.dart';
import 'package:weather_app/core/ui/themes.dart';
import 'package:weather_app/weather/domain/entities/weather.dart';
import 'package:weather_app/weather/presentation/bloc/weather_bloc.dart';
import 'package:weather_app/weather/presentation/ui/home.dart';

class MockWeatherBloc extends MockBloc<WeatherEvent, WeatherState>
    implements WeatherBloc {}

class MockDeviceLocationBloc
    extends MockBloc<DeviceLocationEvent, DeviceLocationState>
    implements DeviceLocationBloc {}

void main() {
  late MockWeatherBloc mockWeatherBloc;
  late MockDeviceLocationBloc mockDeviceLocationBloc;
  late GetWeatherEvent getWeatherEvent;
  late GetLocationEvent getLocationEvent;
  setUp(() {
    mockWeatherBloc = MockWeatherBloc();
    mockDeviceLocationBloc = MockDeviceLocationBloc();
    getWeatherEvent = const GetWeatherEvent(query: '');
    getLocationEvent = const GetLocationEvent();
    registerFallbackValue(getWeatherEvent);
    registerFallbackValue(getLocationEvent);
  });

  final tDeviceLocation = DeviceLocation(
    longitude: 43,
    latitude: 42,
    lastPositionTime: DateTime.parse('2022-02-08T21:21:00.000'),
    accuracy: 200,
  );

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

  Widget createWidgetUnserTest() {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DeviceLocationBloc>(
          create: (context) => mockDeviceLocationBloc,
        ),
        BlocProvider<WeatherBloc>(
          create: (context) => mockWeatherBloc,
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: lightTheme,
        darkTheme: darkTheme,
        home: const HomePage(),
      ),
    );
  }

  void setupSuccessStates() {
    when(() => mockWeatherBloc.state)
        .thenReturn(const WeatherSuccess(tWeather));

    when(() => mockDeviceLocationBloc.state)
        .thenReturn(LocationStateSuccess(tDeviceLocation));
  }

  testWidgets(
      'there must be one BlocBuilder<WeatherBloc, WeatherState> on the screen ',
      (WidgetTester tester) async {
    setupSuccessStates();
    await tester.pumpWidget(
      createWidgetUnserTest(),
    );

    expect(
      find.byType(BlocBuilder<WeatherBloc, WeatherState>),
      findsOneWidget,
    );
  });

  testWidgets(
      'WeatherView widget should be displayed when the bloc state is successfull',
      (WidgetTester tester) async {
    setupSuccessStates();
    await tester.pumpWidget(createWidgetUnserTest());
    await tester.pumpAndSettle(const Duration(seconds: 1));

    expect(
      find.byKey(const Key('WEATHER_VIEW_KEY')),
      findsOneWidget,
    );
  });

  testWidgets(
      'should be displayed a Container when the Locationstate is initial',
      (WidgetTester tester) async {
    when(() => mockDeviceLocationBloc.state).thenReturn(
      const LocationStateInitial(),
    );

    await tester.pumpWidget(
      createWidgetUnserTest(),
    );
    await tester.pumpAndSettle(const Duration(seconds: 1));

    expect(find.byType(Container), findsOneWidget);
  });

  testWidgets(
      'should display EnableLocation widget when the location state is error',
      (WidgetTester tester) async {
    const failure = LocationDisabledFailure();
    when(() => mockDeviceLocationBloc.state).thenReturn(
      const LocationStateError(failure),
    );
    await tester.pumpWidget(
      createWidgetUnserTest(),
    );
    await tester.pumpAndSettle(const Duration(seconds: 1));

    expect(find.byKey(const Key('ENABLE_LOCATION_KEY')), findsOneWidget);
  });
}
