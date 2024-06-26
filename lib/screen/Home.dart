// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:weather_flutter/screen/NotificationScreen.dart';
import 'package:weather_flutter/screen/RealtimeMonitor.dart';
import 'package:badges/badges.dart' as badger;

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int unreadNotifications = 0;
  void incrementUnreadNotifications() {
    setState(() {
      unreadNotifications++;
    });
  }

  void resetUnreadNotifications() {
    setState(() {
      unreadNotifications = 0;
    });
  }

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
                    "https://www.iotevents.org/wp-content/uploads/2017/10/IOT-LOGO-final_transparent-03.png"),
                /*
                 Stack(
                  children: [
                    Center(
                      child: Image.asset(
                        "lib/images/logo.jpeg",
                        height: 150,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
                */
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
              leading: Icon(Icons.wifi),
              title: Text("I P - A D D R E S S"),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, "/ipAddress");
              },
            ),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text("N O T I F I C A T I O N S"),
              onTap: () {
                // Navigate to NotificationScreen
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NotificationScreen(
                      temperature: temperature,
                    ),
                  ),
                );
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
              leading: Icon(Icons.account_circle),
              title: Text("A B O U T"),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, "/about");
              },
            ),
            /*
            ListTile(
              leading: Icon(Icons.bluetooth),
              title: Text("B L U E T O O T H"),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, "/bluetooth");
              },
            ),
            */
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
        title: Center(
          child: Text(
            'EGG-INCUBATOR',
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.w800, color: Colors.white),
          ),
        ),
      ),
      body: RealtimeMonitor(),
      //for notification
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NotificationScreen(
                temperature: temperature,
              ),
            ),
          );
        },
        backgroundColor: Colors.purple[900],
        foregroundColor: Colors.purple[100],
        child: Icon(Icons.notifications),
      ),
    );
  }
}
