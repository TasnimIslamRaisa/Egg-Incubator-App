// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:weather_flutter/screen/IpAddress.dart';

class Bluetooth extends StatefulWidget {
  const Bluetooth({Key? key}) : super(key: key);

  @override
  State<Bluetooth> createState() => _BluetoothState();
}

class _BluetoothState extends State<Bluetooth> {
  final TextEditingController _controller = TextEditingController();
  bool _showSetIpButton = false;
  final IpAddress _ipAddress = IpAddress();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" B L U E T O O T H "),
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
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'IP Address',
                hintText: 'Enter IP Address',
                suffixIcon: _showSetIpButton
                    ? IconButton(
                        icon: Icon(Icons.check),
                        onPressed: () {
                          _showConfirmationDialog(context);
                        },
                      )
                    : null,
              ),
              onTap: () {
                setState(() {
                  _showSetIpButton = true;
                });
              },
            ),
            SizedBox(height: 20),
            _showSetIpButton
                ? ElevatedButton(
                    onPressed: () {
                      _showConfirmationDialog(context);
                    },
                    child: Text('Set IP'),
                  )
                : SizedBox(),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _saveIpAddress(context); // Pass context here
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }

  void _saveIpAddress(BuildContext context) async {
    await IpAddress.writeIpAddresses(
        _controller.text as List<String>); // Use _ipAddress object
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('IP Address saved')),
    );
  }

  Future<void> _showConfirmationDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmation'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Choose an action:'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Go to Browse'),
              onPressed: () {
                // Navigate to browse page with the indicated IP
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
