import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/device_location/presentation/bloc/device_location_bloc.dart';
import 'package:weather_app/core/ui/themes.dart';
import 'package:weather_app/injection_container.dart' as di;
import 'package:weather_app/weather/presentation/bloc/weather_bloc.dart';
import 'package:weather_app/weather/presentation/ui/home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DeviceLocationBloc>(
          create: (context) => di.sl<DeviceLocationBloc>(),
        ),
        BlocProvider<WeatherBloc>(
          create: (context) => di.sl<WeatherBloc>(),
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
}
