import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/weather/presentation/bloc/weather_bloc.dart';
import 'package:weather_app/weather/presentation/ui/widgets/custom_field.dart';
import 'package:weather_app/weather/presentation/ui/widgets/weather_error.dart';

import 'loaded_weather.dart';

class WeatherView extends StatefulWidget {
  final TextEditingController searchTextController;
  const WeatherView({
    Key? key,
    required this.searchTextController,
  }) : super(key: key);

  @override
  State<WeatherView> createState() => _WeatherViewState();
}

class _WeatherViewState extends State<WeatherView> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(
            top: 44.0,
            left: 24.0,
            right: 24.00,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Form(
                  key: _formKey,
                  child: CustomField(
                    controller: widget.searchTextController,
                    formKey: _formKey,
                  ),
                ),
                const SizedBox(
                  height: 80,
                ),
                BlocBuilder<WeatherBloc, WeatherState>(
                  builder: (context, state) {
                    if (state is WeatherLoading || state is WeatherInitial) {
                      return const Center(
                        child: CircularProgressIndicator.adaptive(),
                      );
                    } else if (state is WeatherError) {
                      return ErrorFetchWeather(
                        message: state.message,
                      );
                    } else if (state is WeatherSuccess) {
                      return LoadedWeather(
                        state: state,
                      );
                    }
                    throw const ErrorFetchWeather(
                      message: "Something went wrong!",
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
