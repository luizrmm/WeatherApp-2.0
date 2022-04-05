import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/device_location/presentation/bloc/device_location_bloc.dart';

import 'package:weather_app/injection_container.dart';
import 'package:weather_app/weather/presentation/bloc/weather_bloc.dart';
import 'package:weather_app/weather/presentation/ui/widgets/enable_location.dart';
import 'package:weather_app/weather/presentation/ui/widgets/weather_error.dart';
import 'package:weather_app/weather/presentation/ui/widgets/weather_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController searchTextController = TextEditingController();
  @override
  void initState() {
    BlocProvider.of<DeviceLocationBloc>(context).add(const GetLocationEvent());
    super.initState();
  }

  @override
  void dispose() {
    searchTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WeatherBloc>(
      create: (context) => sl<WeatherBloc>(),
      child: BlocBuilder<DeviceLocationBloc, DeviceLocationState>(
        builder: (context, state) {
          if (state is LocationStateInitial) {
            return Container();
          } else if (state is LocationStateSuccess) {
            _getWeather(context, state);
            return WeatherView(searchTextController: searchTextController);
          } else if (state is LocationStateSuccess) {
            return const EnableLocation();
          } else if (state is LocationStateLoading) {
            return Material(
              child: Container(),
            );
          }
          return const Material(
              child: Center(
            child: WeatherErrorWidget(),
          ));
        },
      ),
    );
  }

  _getWeather(BuildContext context, LocationStateSuccess state) {
    BlocProvider.of<WeatherBloc>(context, listen: false).add(
      GetWeatherEvent(
          query: '${state.location.latitude},${state.location.longitude}'),
    );
  }
}
