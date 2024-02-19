// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:weather_flutter/modal/ProgressBarContainer.dart';

class RealtimeMonitor extends StatefulWidget {
  const RealtimeMonitor({
    super.key,
  });

  @override
  State<RealtimeMonitor> createState() => _RealtimeMonitorState();
}

class _RealtimeMonitorState extends State<RealtimeMonitor> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [Colors.deepPurple[100]!, Colors.deepPurple[800]!],
      )),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ProgressBarContainer(
              label: 'Humidity',
              value: 70, // Replace this value with your actual humidity value
            ),
            ProgressBarContainer(
              label: 'Temperature',
              value:
                  25, // Replace this value with your actual temperature value
            ),
            ProgressBarContainer(
              label: 'Distance',
              value: 60, // Replace this value with your actual distance value
            ),
            //YoutubeSubscriber(),
          ],
        ),
      ),
    ));
  }
}
