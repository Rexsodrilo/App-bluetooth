// lib/main.dart
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bluetooth Audio Share',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CompatibilityScreen(),
    );
  }
}

class CompatibilityScreen extends StatefulWidget {
  @override
  _CompatibilityScreenState createState() => _CompatibilityScreenState();
}

class _CompatibilityScreenState extends State<CompatibilityScreen> {
  bool? isCompatible;

  @override
  void initState() {
    super.initState();
    checkCompatibility();
  }

  Future<void> checkCompatibility() async {
    // Simulate compatibility check
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      isCompatible = true; // Assume compatible for this demo
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bluetooth Audio Share')),
      body: Center(
        child: isCompatible == null
            ? CircularProgressIndicator()
            : isCompatible == true
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Your device supports multiple audio outputs.'),
                      SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BluetoothDevicesScreen()),
                          );
                        },
                        child: Text('Continue'),
                      ),
                    ],
                  )
                : Text('This device does not support multiple audio outputs.'),
      ),
    );
  }
}

class BluetoothDevicesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Replace with actual Bluetooth logic
    return Scaffold(
      appBar: AppBar(title: Text('Available Devices')),
      body: Center(
        child: Text('List of available Bluetooth devices.'),
      ),
    );
  }
}
  
