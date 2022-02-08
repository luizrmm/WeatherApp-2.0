import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
          padding: const EdgeInsets.only(
            top: 44.0,
            left: 24.0,
            right: 24.00,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 46,
                  child: CustomField(),
                ),
                const SizedBox(
                  height: 80,
                ),
                SvgPicture.asset(
                  'assets/teste.svg',
                  height: 113,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 32.0, bottom: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Hyderabad',
                        style: TextStyle(
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
                const Text(
                  "31°",
                  style: TextStyle(
                    fontSize: 70.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Container(
                  height: 60.0,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      color: const Color(
                        0xFFFDFCFC,
                      ),
                      borderRadius: BorderRadius.circular(10.0)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
