import 'package:flutter/material.dart';
import 'welcome.dart';
import 'temperature.dart';
//Most of the code are sample given, only route:temperature is added
class TemperatureApp extends StatefulWidget {
  const TemperatureApp({super.key});

  @override
  State<TemperatureApp> createState() {
    return _TemperatureAppState();
  }
}

class _TemperatureAppState extends State<TemperatureApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff16C062),
                Color(0xff00BCDC),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: const Welcome(),
        ),
      ),
      //Adding  code: route: temperature
      //to define named routes in the app, routes are used for mappings of string names
      routes: {
        '/temperature': (context) => const Temperature(),
      },
    );
  }
}

void main() {
  runApp(const TemperatureApp());
}
