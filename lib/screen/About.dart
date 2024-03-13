import 'package:flutter/material.dart';

class About extends StatefulWidget {
  const About({super.key});
  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" A B O U T"),
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
      ),
      body: Column(//mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: Container(
            height: 50,
            width: 350,
            decoration: BoxDecoration(
                color: Colors.deepPurple[100],
                borderRadius: BorderRadius.circular(20)),
            child: Center(
                child: Text(
              "About This App",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
            )),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: Container(
            height: 590,
            width: 340,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              //color: Colors.deepPurple[100],
            ),
            child: Center(
                child: Padding(
              padding: const EdgeInsets.all(15),
              child: Center(
                child: Text(
                  "The project uses IoT technology to revolutionize egg incubation by integrating sensors like ultrasonic, DHT11, and ESP32. This system continuously monitors and regulates the incubation environment, with a mobile application providing real-time data on temperature and humidity levels. The app dynamically adjusts its display color when deviations from the optimal temperature range occur, minimizing hatch failure risk. AI technology can learn from past data, predict environmental fluctuations, and offer proactive recommendations for maintaining ideal conditions. This project lays the groundwork for broader IoT solutions in agriculture, enhancing productivity and efficiency by remotely monitoring and controlling environmental parameters. The project lays the groundwork for a broader range of IoT solutions in agriculture.",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            )),
          ),
        ),
      ]),
    );
  }
}
