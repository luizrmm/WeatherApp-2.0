import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/helpers/weather_condition.dart';
import 'package:weather_app/weather/presentation/bloc/weather_bloc.dart';
import 'package:weather_app/weather/presentation/ui/widgets/custom_field.dart';

import 'location_name.dart';
import 'weather_info.dart';

class WeatherView extends StatelessWidget {
  final TextEditingController searchTextController;
  const WeatherView({
    Key? key,
    required this.searchTextController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(
            top: 44.0,
            left: 24.0,
            right: 24.00,
          ),
          child: SingleChildScrollView(
            child: BlocBuilder<WeatherBloc, WeatherState>(
              builder: (context, state) {
                if (state is WeatherLoading || state is WeatherInitial) {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                } else if (state is WeatherError) {
                  return Text(state.message);
                } else if (state is WeatherSuccess) {
                  return Column(
                    children: [
                      SizedBox(
                        height: 46,
                        child: CustomField(
                          controller: searchTextController,
                        ),
                      ),
                      const SizedBox(
                        height: 80,
                      ),
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
                        style: const TextStyle(
                          fontSize: 70.0,
                          fontWeight: FontWeight.w500,
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
                        preciptation:
                            state.weather.current.preciptationMM.toString(),
                        humidity: state.weather.current.humidity.toString(),
                      ),
                    ],
                  );
                }
                throw ErrorDescription("No state in bloc");
              },
            ),
          ),
        ),
      ),
    );
  }
}
