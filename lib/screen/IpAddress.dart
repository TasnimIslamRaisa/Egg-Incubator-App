// ignore_for_file: library_private_types_in_public_api, unused_import, prefer_final_fields, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:weather_flutter/screen/IpAddress.dart';

class IpAddressScreen extends StatefulWidget {
  @override
  _IpAddressScreenState createState() => _IpAddressScreenState();
}

class _IpAddressScreenState extends State<IpAddressScreen> {
  TextEditingController _controller = TextEditingController();

  IpAddress _ipAddress =
      IpAddress(); // Create an instance of the IpAddress class

  @override
  void initState() {
    super.initState();
    _loadIpAddress();
  }

  Future<void> _loadIpAddress() async {
    String? ipAddress = await _ipAddress.readIpAddress(); // Use the instance
    if (ipAddress != null) {
      setState(() {
        _controller.text = ipAddress;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('IP Address'),
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
      body: Text("Saved IP Address"),
    );
  }

  void _saveIpAddress(BuildContext context) async {
    await _ipAddress.writeIpAddress(_controller.text); // Use the instance
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('IP Address saved')),
    );
  }
}

class IpAddress {
  writeIpAddress(String text) {}

  readIpAddress() {}
}
