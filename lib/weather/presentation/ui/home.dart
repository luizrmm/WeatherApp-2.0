import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather_app/core/helpers/date_helpers.dart';
import 'package:weather_app/core/helpers/weather_condition.dart';
import 'package:weather_app/injection_container.dart';
import 'package:weather_app/weather/presentation/bloc/weather_bloc.dart';
import 'package:weather_app/weather/presentation/ui/widgets/custom_field.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<WeatherBloc>(
      create: (context) =>
          sl<WeatherBloc>()..add(const GetWeatherEvent(query: 'Vancouver')),
      child: const WeatherView(),
    );
  }
}

class WeatherView extends StatelessWidget {
  const WeatherView({
    Key? key,
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
                if (state is WeatherLoading) {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                } else if (state is WeatherError) {
                  return Text(state.message);
                } else if (state is WeatherSuccess) {
                  return Column(
                    children: [
                      const SizedBox(
                        height: 46,
                        child: CustomField(),
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
                      Padding(
                        padding: const EdgeInsets.only(top: 32.0, bottom: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              state.weather.location.name,
                              style: const TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              width: 12.0,
                            ),
                            SvgPicture.asset(
                              'assets/arrow.svg',
                              height: 21,
                              width: 21,
                            )
                          ],
                        ),
                      ),
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
                      Container(
                        height: 60.0,
                        width: double.maxFinite,
                        padding: const EdgeInsets.symmetric(
                            vertical: 6, horizontal: 20),
                        decoration: BoxDecoration(
                          color: const Color(
                            0xFFFDFCFC,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'TIME',
                                  style: TextStyle(
                                    color: Color(0xFFC4C4C4),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  formatDateAmPm(
                                    state.weather.current.lastUpdated,
                                  ),
                                  style: const TextStyle(
                                    color: Color(0xFF9A9A9A),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'UV',
                                  style: TextStyle(
                                    color: Color(0xFFC4C4C4),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  state.weather.current.uv.toString(),
                                  style: const TextStyle(
                                    color: Color(0xFF9A9A9A),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'PREC',
                                  style: TextStyle(
                                    color: Color(0xFFC4C4C4),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  state.weather.current.preciptationMM
                                      .toString(),
                                  style: const TextStyle(
                                    color: Color(0xFF9A9A9A),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'HUMIDITY',
                                  style: TextStyle(
                                    color: Color(0xFFC4C4C4),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  state.weather.current.humidity.toString(),
                                  style: const TextStyle(
                                    color: Color(0xFF9A9A9A),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  );
                }
                return const Text('none');
              },
            ),
          ),
        ),
      ),
    );
  }
}
