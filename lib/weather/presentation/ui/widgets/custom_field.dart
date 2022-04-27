import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/weather/presentation/bloc/weather_bloc.dart';

class CustomField extends StatelessWidget {
  const CustomField({Key? key, required this.controller, required this.formKey})
      : super(key: key);

  final GlobalKey<FormState> formKey;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: const Key('SEARCH_FIELD'),
      controller: controller,
      onFieldSubmitted: (value) {
        if (formKey.currentState!.validate()) {
          search(value, context);
        }
      },
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        filled: true,
        fillColor: Theme.of(context).colorScheme.secondary,
        suffixIcon: IconButton(
          key: const Key('SEARCH_BUTTON'),
          onPressed: () {
            if (formKey.currentState!.validate()) {
              search(controller.text, context);
            }
          },
          icon: Icon(
            Icons.search,
            size: 18,
            color: Theme.of(context).hintColor,
          ),
        ),
        hintText: 'Search Location',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Locations is required';
        }
        return null;
      },
    );
  }

  void search(String value, BuildContext context) {
    BlocProvider.of<WeatherBloc>(context).add(GetWeatherEvent(query: value));
    controller.clear();
  }
}
