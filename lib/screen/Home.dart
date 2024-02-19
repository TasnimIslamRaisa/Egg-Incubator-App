// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:weather_flutter/screen/RealtimeMonitor.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
                //decoration: BoxDecoration(color: Colors.deepPurple[400]),
                child: UserAccountsDrawerHeader(
              currentAccountPictureSize: Size.square(100),
              accountName: Text(""),
              accountEmail: Text(" E G G - I N C U B A T O R "),
              currentAccountPicture: Center(
                child: Image.network(
                  "https://www.iotevents.org/wp-content/uploads/2017/10/IOT-LOGO-final_transparent-03.png",
                ),
              ),
            )),
            ListTile(
              leading: Icon(Icons.lightbulb_circle),
              title: Text("L I G H T"),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, "/light");
              },
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("H O M E"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("S E T T I N G S"),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, "/settings");
              },
            ),
            ListTile(
              leading: Icon(Icons.crisis_alert),
              title: Text("A B O U T"),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, "/about");
              },
            ),
          ],
        ),
      ),
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
          ' E G G - I N C U B A T O R ',
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.w800, color: Colors.white),
        ),
      ),
      body: RealtimeMonitor(),
    );
  }
}
