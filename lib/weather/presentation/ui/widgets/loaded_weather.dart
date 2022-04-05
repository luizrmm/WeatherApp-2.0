import 'package:flutter/material.dart';
import 'package:weather_app/core/helpers/weather_condition.dart';
import 'package:weather_app/weather/presentation/bloc/weather_bloc.dart';

import 'location_name.dart';
import 'weather_info.dart';

class LoadedWeather extends StatelessWidget {
  const LoadedWeather({
    Key? key,
    required this.state,
  }) : super(key: key);
  final WeatherSuccess state;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/icons/${getIcon(
            state.weather.current.condition.code,
            state.weather.current.lastUpdated,
          )}.png',
          height: 130,
        ),
        LocationName(state.weather.location.name),
        Text(
          '${state.weather.current.tempCInteger.toString()} ˚',
          style: TextStyle(
            fontSize: 70.0,
            fontWeight: FontWeight.w500,
            color: Theme.of(context).textTheme.headline1!.color,
          ),
        ),
        Text(
          state.weather.current.condition.text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 16,
            color: Color(0xFFC4C4C4),
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        WeatherInfo(
          lastUpdate: state.weather.current.lastUpdated,
          uv: state.weather.current.uv.toString(),
          preciptation: state.weather.current.preciptationMM.toString(),
          humidity: state.weather.current.humidity.toString(),
        ),
      ],
    );
  }
}
