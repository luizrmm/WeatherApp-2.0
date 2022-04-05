import 'package:flutter/material.dart';

class ErrorFetchWeather extends StatelessWidget {
  const ErrorFetchWeather({
    Key? key,
    required this.message,
  }) : super(key: key);
  final String message;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/cloud_error.png'),
        Text(
          message,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24,
            color: Theme.of(context).textTheme.headline1!.color,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
