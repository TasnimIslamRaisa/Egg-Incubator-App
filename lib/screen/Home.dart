// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:weather_flutter/screen/Notification.dart';
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
              title: Row(
                children: [
                  badger.Badge(
                    child: Icon(Icons.notifications),
                    badgeContent: Text(
                      unreadNotifications.toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                    badgeColor: Colors.red, // Set badge color
                    animationType:
                        badger.BadgeAnimationType.scale, // Set badge animation
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text("N O T I F I  C A T I O N"),
                ],
              ),
              onTap: () {
                // Navigate to NotificationScreen
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        NotificationScreen(temperature: temperature),
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
              leading: Icon(Icons.crisis_alert),
              title: Text("A B O U T"),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, "/about");
              },
            ),
            ListTile(
              leading: Icon(Icons.bluetooth),
              title: Text("B L U E T O O T H"),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, "/bluetooth");
              },
            ),
            ListTile(
              leading: Icon(Icons.wifi),
              title: Text("Saved IP Address"),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, "/ipAddress");
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
        title: Center(
          child: Text(
            'EGG-INCUBATOR',
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.w800, color: Colors.white),
          ),
        ),
      ),
      body: RealtimeMonitor(),
    );
  }
}
