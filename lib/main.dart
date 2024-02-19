import 'package:flutter/material.dart';
import 'package:weather_flutter/modal/MyAppContainer.dart';
import 'package:weather_flutter/screen/About.dart';
import 'package:weather_flutter/screen/Home.dart';
import 'package:weather_flutter/screen/Light.dart';
import 'package:weather_flutter/screen/Settings.dart';

bool isDark = false;
bool isOn = false;
bool isLightOn = false;

void main() {
  runApp(
    Directionality(
      textDirection: TextDirection.ltr, // or any other appropriate text direction
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MyAppContainer(
      child: MaterialApp(
        title: 'Realtime Monitor',
        theme: isDark ? ThemeData.dark() : ThemeData.light(),
        debugShowCheckedModeBanner: false,
        home: Home(),
        routes: {
          //"/": (context) => Home(),
          "/settings": (context) => Settings(
                toggleTheme: () {
                  setState(() {
                    isOn = !isOn;
                    isDark = !isDark;
                  });
                },
              ),
          "/about": (context) => About(),
          "/light": (context) => Light(
                toggleLight: () {
                  setState(() {
                    isLightOn = !isLightOn;
                  });
                },
              ),
        },
      ),
    );
  }
}
