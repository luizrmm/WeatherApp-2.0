import 'package:flutter/material.dart';
import 'package:weather_app/core/helpers/date_helpers.dart';

class WeatherInfo extends StatelessWidget {
  final String lastUpdate;
  final String uv;
  final String preciptation;
  final String humidity;
  const WeatherInfo({
    Key? key,
    required this.lastUpdate,
    required this.uv,
    required this.preciptation,
    required this.humidity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      width: double.maxFinite,
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'TIME',
                style: TextStyle(
                  color: Theme.of(context).hintColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                formatDateAmPm(
                  lastUpdate,
                ),
                style: TextStyle(
                  color: Theme.of(context).textTheme.headline2!.color,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'UV',
                style: TextStyle(
                  color: Theme.of(context).hintColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                uv,
                style: TextStyle(
                  color: Theme.of(context).textTheme.headline2!.color,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'PREC',
                style: TextStyle(
                  color: Theme.of(context).hintColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                preciptation,
                style: TextStyle(
                  color: Theme.of(context).textTheme.headline2!.color,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'HUMIDITY',
                style: TextStyle(
                  color: Theme.of(context).hintColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                '$humidity  %',
                style: TextStyle(
                  color: Theme.of(context).textTheme.headline2!.color,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
