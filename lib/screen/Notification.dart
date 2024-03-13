import 'package:flutter/material.dart';
import 'package:weather_flutter/screen/RealtimeMonitor.dart';

class NotificationScreen extends StatefulWidget {
  // const NotificationScreen({Key? key, required double temperature}): super(key: key);
  final double temperature;

  const NotificationScreen({Key? key, required this.temperature})
      : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  //int temperature = 0; // Replace with actual temperature value
  List<NotificationData> notifications = [];

  @override
  Widget build(BuildContext context) {
    String notificationMessage = '';
    Color notificationColor = Colors.transparent;

    if (temperature >= 38) {
      notificationMessage =
          'The temperature is high! Please turn off the light';
      notificationColor = Colors.red;
    } else if (temperature <= 35) {
      notificationMessage = 'The temperature is low! Please turn on the light';
      notificationColor = Colors.purple[800]!;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("N O T I F I C A T I O N"),
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
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          // Display notification with timestamp
          return ListTile(
            title: Text(notifications[index].notificationMessage),
            subtitle: Text(notifications[index].timestamp.toString()),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add a sample notification when FAB is pressed
          addNotification();
        },
        child: Icon(Icons.add),
      ),
    );
  }

  // Function to add a notification to the list
  /*
  void addNotification() {
    setState(() {
      notifications.add(NotificationData(
        message:
            'Sample notification', // Replace with actual notification message
        timestamp: DateTime.now(), // Use current timestamp
      ));
    }
    );
  }*/

  void addNotification() {
    if (temperature >= 38) {
      setState(() {
        notifications.add(NotificationData(
          notificationMessage:
              'The temperature is high! Please turn off the light',
          timestamp: DateTime.now(), // Replace with actual notification message
          // Use current timestamp
        ));
      });
    } else if (temperature <= 35) {
      setState(() {
        notifications.add(NotificationData(
          notificationMessage:
              'The temperature is Low! Please turn on the light', // Replace with actual notification message
          timestamp: DateTime.now(), // Use current timestamp
        ));
      });
    }
  }
}

class NotificationData {
  final String notificationMessage;
  final DateTime timestamp;

  NotificationData({
    required this.notificationMessage,
    required this.timestamp,
  });
}
