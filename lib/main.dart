import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tasky/screens/home_screen.dart';
import 'package:tasky/screens/welcome_screen.dart';

void main() {
  SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DeviceFrame(
        device: Devices.android.samsungGalaxyNote20,
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
