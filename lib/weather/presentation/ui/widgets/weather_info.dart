import 'package:flutter/widgets.dart';
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
                  lastUpdate,
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
                uv,
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
                preciptation,
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
                '$humidity  %',
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
    );
  }
}
