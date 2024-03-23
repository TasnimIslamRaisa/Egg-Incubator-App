import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_flutter/Bluetooth.dart';
import 'package:weather_flutter/modal/MyAppContainer.dart';
import 'package:weather_flutter/screen/About.dart';
import 'package:weather_flutter/screen/Home.dart';
import 'package:weather_flutter/screen/IpAddress.dart';
import 'package:weather_flutter/screen/Light.dart';
import 'package:weather_flutter/screen/RealtimeMonitor.dart';
import 'package:weather_flutter/screen/Settings.dart';
import 'package:weather_flutter/screen/NotificationScreen.dart';

bool isDark = false;
bool isOn = false;
bool isLightOn = true;

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => NotificationProvider(),
      child: const Directionality(
        textDirection: TextDirection.ltr,
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MyAppContainer(
      child: MaterialApp(
        title: 'Egg Incubator',
        theme: isDark ? ThemeData.dark() : ThemeData.light(),
        debugShowCheckedModeBanner: false,
        home: const Home(),
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
          "/about": (context) => const About(),
          "/ipsave": (context) => IpAddressScreen(),
          "/notifications": (context) => NotificationScreen(
                temperature: temperature,
              ),
          "/bluetooth": (context) => const Bluetooth(),
          "/ipAddress": (context) => IpAddressScreen(),
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
