import 'package:flutter/material.dart' show Alignment, AppBar, BoxDecoration, BuildContext, ChangeNotifier, Colors, Container, FloatingActionButton, Icon, Icons, Key, LinearGradient, ListTile, ListView, Scaffold, State, StatefulWidget, Text, Widget;
import 'package:provider/provider.dart';

class NotificationScreen extends StatefulWidget {
  final double temperature;

  const NotificationScreen({Key? key, required this.temperature})
      : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<NotificationData> notifications = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const  Text("N O T I F I C A T I O N S"),
        centerTitle: true,
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.deepPurple[50]!, Colors.deepPurple[200]!],
            ),
          ),
        ),
      ),
      body: Consumer<NotificationProvider>(
        builder: (context, provider, _) {
          return ListView.builder(
            itemCount: provider.notifications.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(provider.notifications[index].notificationMessage),
                subtitle:
                    Text(provider.notifications[index].timestamp.toString()),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addNotification();
        },
        child: const Icon(Icons.notifications),
      ),
    );
  }

  void _addNotification() {
    double temperature = widget.temperature;
    if (temperature >= 30) {
      notifications.add(NotificationData(
        notificationMessage:
            'The temperature is high! Please turn off the light',
        timestamp: DateTime.now(),
      ));
    } else if (temperature < 30) {
      notifications.add(NotificationData(
        notificationMessage: 'The temperature is Low! Please turn on the light',
        timestamp: DateTime.now(),
      ));
    }
    Provider.of<NotificationProvider>(context, listen: false)
        .addNotification(notifications.last);
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

class NotificationProvider extends ChangeNotifier {
  final List<NotificationData> _notifications = [];

  List<NotificationData> get notifications => _notifications;

  void addNotification(NotificationData notification) {
    _notifications.add(notification);
    notifyListeners();
  }
}
