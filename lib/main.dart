import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:tasky/screens/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DeviceFrame(
        device: Devices.android.samsungGalaxyNote20Ultra,
        // 👈 iPhone device frame
        screen: Builder(
          builder: (context) {
            return WelcomeScreen();
          },
        ),
      ),
    );
  }
}
