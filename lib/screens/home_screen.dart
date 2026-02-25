import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFF181818),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsetsGeometry.all(16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage(
                      "assets/images/avatar_example.png",
                    ),
                  ),
                  Spacer(flex: 1),
                  const Column(
                    children: [
                      Text(
                        "Good Evening ,Usama ",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: Color(0XFFFFFCFC),
                        ),
                      ),
                      Text(
                        "One task at a time.One step closer",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Color(0XFFC6C6C6),
                        ),
                      ),
                    ],
                  ),
                  Spacer(flex: 2),
                  SvgPicture.asset("assets/images/Light.svg"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
