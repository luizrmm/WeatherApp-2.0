import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/weather/presentation/bloc/weather_bloc.dart';

class CustomField extends StatelessWidget {
  final TextEditingController controller;
  const CustomField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onSubmitted: (value) {
        search(value, context);
      },
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 8, horizontal: 16.0),
        filled: true,
        fillColor: Theme.of(context).colorScheme.secondary,
        suffixIcon: IconButton(
          onPressed: () {
            search(controller.text, context);
          },
          icon: Icon(
            Icons.search,
            size: 18,
            color: Theme.of(context).hintColor,
          ),
        ),
        hintText: "Search Location",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  void search(String value, BuildContext context) {
    BlocProvider.of<WeatherBloc>(context).add(GetWeatherEvent(query: value));
    controller.clear();
  }
}
