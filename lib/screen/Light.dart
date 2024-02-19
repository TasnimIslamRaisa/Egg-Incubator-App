import 'package:flutter/material.dart';
import 'package:weather_flutter/main.dart';

class Light extends StatefulWidget {
  final VoidCallback toggleLight;
  const Light({super.key, required this.toggleLight});

  @override
  State<Light> createState() => _LightState();
}

class _LightState extends State<Light> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Light On-Off"),
        centerTitle: true,
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
        //backgroundColor: Colors.deepPurple[400],
      ),
      body: Center(
        child: Container(
          height: 320,
          width: 320,
          decoration: BoxDecoration(
              color: Colors.deepPurple[100],
              borderRadius: BorderRadius.circular(25)),
          child: IconButton(
            onPressed: () {
              widget.toggleLight();
            },
            icon: Icon(
              isLightOn
                  ? Icons.lightbulb_circle_rounded
                  : Icons.lightbulb_circle_rounded,
              size: 250,
              color: isLightOn ? Colors.yellow[500] : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
