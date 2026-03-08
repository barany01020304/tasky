import 'dart:io';

import 'package:device_frame/device_frame.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tasky/screens/home_screen.dart';
import 'package:tasky/screens/welcome_screen.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  var pref = await SharedPreferences.getInstance();
  String? name = pref.getString("name");

  runApp(
    DevicePreview(

      enabled: true,
      builder: (context) => MyApp(name: name,), // Your app
    ),
  );
}
// class MyApp extends StatelessWidget {
//   const MyApp({super.key, this.name});
//
//   final String? name;
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: DeviceFrame(
//         device: Devices.android.samsungGalaxyNote20,
//         screen: name == null ? WelcomeScreen() : HomeScreen(),
//       ),
//     );
//   }
// }
class MyApp extends StatelessWidget {
  const MyApp({super.key, this.name});
  final String? name;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //useInheritedMediaQuery: true, // Important for DevicePreview
      builder: DevicePreview.appBuilder,
      home:  name == null ? WelcomeScreen() : HomeScreen(),
    );
  }
}