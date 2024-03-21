import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:weather_flutter/modal/ProgressBarContainer.dart';

double temperature = 0;
double humidity = 0;
double distance = 0;

class RealtimeMonitor extends StatefulWidget {
  const RealtimeMonitor({Key? key}) : super(key: key);

  @override
  State<RealtimeMonitor> createState() => _RealtimeMonitorState();
}

class _RealtimeMonitorState extends State<RealtimeMonitor> {
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    // Start a periodic timer to fetch data every 2 seconds
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      fetchData();
    });
  }

  @override
  void dispose() {
    // Dispose the timer to prevent memory leaks
    _timer.cancel();
    super.dispose();
  }

  Future<void> fetchData() async {
    final response = await get(
        Uri.parse('http://192.168.0.112/sensor-data')); // ESP32's IP address
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        temperature = data['temperature'];
        humidity = data['humidity'];
        distance = data['distance'];
        //test = temperature;
      });
    } else {
      // Handle error
    }
  }

  /// Function to define the gradient color based on temperature
  LinearGradient getGradientColor() {
    if (temperature >= 25) {
      // Return red gradient color
      return LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomRight,
        colors: [Colors.red[400]!, Colors.deepPurple[50]!],
      );
    } else {
      // Return default gradient color
      return LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [Colors.deepPurple[50]!, Colors.deepPurple[200]!],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          gradient: getGradientColor(), // Use the gradient color here
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ProgressBarContainer(
                label: 'Temperature',
                value: temperature.toInt(),
                unit: '°C',
              ),
              ProgressBarContainer(
                label: 'Humidity',
                value: humidity.toInt(),
                unit: '%',
              ),
              ProgressBarContainer(
                label: 'Distance',
                value: distance.toInt(),
                unit: 'cm',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
