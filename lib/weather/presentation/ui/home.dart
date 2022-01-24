import 'package:flutter/material.dart';
import 'package:weather_app/weather/presentation/ui/widgets/custom_field.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 44.0,
            horizontal: 24.0,
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 46,
                child: CustomField(),
              ),
              Image.asset(
                'assets/sunny.png',
                height: 113,
              )
            ],
          ),
        ),
      ),
    );
  }
}
