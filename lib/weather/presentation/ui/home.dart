import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weather_app/injection_container.dart';
import 'package:weather_app/weather/presentation/bloc/weather_bloc.dart';
import 'package:weather_app/weather/presentation/ui/widgets/weather_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController searchTextController = TextEditingController();

  @override
  void dispose() {
    searchTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WeatherBloc>(
      create: (context) => sl<WeatherBloc>()
        ..add(
          const GetWeatherEvent(query: 'Muzambinho'),
        ),
      child: WeatherView(
        searchTextController: searchTextController,
      ),
    );
  }
}
