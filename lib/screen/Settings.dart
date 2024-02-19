// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

// ignore: unused_import
import 'package:weather_flutter/main.dart';

class Settings extends StatefulWidget {
  final VoidCallback toggleTheme;
  const Settings({super.key, required this.toggleTheme});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.deepPurple[100]!, Colors.deepPurple[200]!],
            ),
          ),
        ),
        centerTitle: true,
        title: Text(
          "S E T T I N G S",
        ),
      ),
      body: Column(children: [
        Padding(
          padding: EdgeInsets.all(30),
          //child: GestureDetector(
          child: Container(
            height: 60,
            width: 355,
            //color: Colors.deepPurple[300],
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.deepPurple[200],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: GestureDetector(
                    child: Text(
                      "Turn On Dark Mode",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    isOn ? Icons.toggle_on : Icons.toggle_off,
                    size: 50,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    widget.toggleTheme();
                  },
                ),
              ],
            ),
          ),
          //),
        ),
      ]),
    );
  }
}
