// ignore_for_file: library_private_types_in_public_api, unused_import, prefer_final_fields, prefer_const_constructors

import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class IpAddressScreen extends StatefulWidget {
  @override
  _IpAddressScreenState createState() => _IpAddressScreenState();
}

class _IpAddressScreenState extends State<IpAddressScreen> {
  TextEditingController _controller = TextEditingController();
  List<String> _ipAddresses = [];

  @override
  void initState() {
    super.initState();
    _loadIpAddresses();
  }

  Future<void> _loadIpAddresses() async {
    List<String>? ipAddresses = await IpAddress.readIpAddresses();
    if (ipAddresses != null) {
      setState(() {
        _ipAddresses = ipAddresses;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('IP Addresses'),
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
        itemCount: _ipAddresses.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_ipAddresses[index]),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => _deleteIpAddress(index),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addIpAddress(context),
        child: Icon(Icons.add),
      ),
    );
  }

  Future<void> _addIpAddress(BuildContext context) async {
    String? ipAddress = await showDialog(
      context: context,
      builder: (context) => _buildAddIpAddressDialog(context),
    );
    if (ipAddress != null) {
      await IpAddress.addIpAddress(ipAddress);
      await _loadIpAddresses();
    }
  }

  Widget _buildAddIpAddressDialog(BuildContext context) {
    return AlertDialog(
      title: Text('Add IP Address'),
      content: TextField(
        controller: _controller,
        decoration: InputDecoration(labelText: 'Enter IP Address'),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(null);
          },
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(_controller.text);
          },
          child: Text('Add'),
        ),
      ],
    );
  }

  Future<void> _deleteIpAddress(int index) async {
    await IpAddress.deleteIpAddress(index);
    await _loadIpAddresses();
  }
}

class IpAddress {
  static const String _fileName = 'ip_addresses.txt';

  static Future<void> addIpAddress(String ipAddress) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/$_fileName');
      List<String> ipAddresses = await readIpAddresses() ?? [];
      ipAddresses.add(ipAddress);
      await file.writeAsString(ipAddresses.join('\n'));
    } catch (e) {
      print('Error writing IP address: $e');
    }
  }

  static Future<List<String>?> readIpAddresses() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/$_fileName');
      if (await file.exists()) {
        List<String> ipAddresses = await file.readAsLines();
        return ipAddresses;
      }
    } catch (e) {
      print('Error reading IP addresses: $e');
    }
    return null;
  }

  static Future<void> deleteIpAddress(int index) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/$_fileName');
      List<String> ipAddresses = await readIpAddresses() ?? [];
      if (index >= 0 && index < ipAddresses.length) {
        ipAddresses.removeAt(index);
        await file.writeAsString(ipAddresses.join('\n'));
      }
    } catch (e) {
      print('Error deleting IP address: $e');
    }
  }

  static writeIpAddresses(List<String> text) {}
}
