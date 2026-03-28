import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tasky/screens/completed_screen.dart';
import 'package:tasky/screens/profile_screen.dart';
import 'package:tasky/screens/to_do_screen.dart';

import 'home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<Widget> _widgets = [
    HomeScreen(),
    ToDoScreen(),
    CompletedScreen(),
    ProfileScreen(),
  ];
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (index) {
          setState(() {
            _index = index;
          });
        },
        backgroundColor: Color(0XFF181818),
        selectedItemColor: Color(0xFF15B86C),
        unselectedItemColor: Color(0xFFFFFCFC),
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/images/home_icon.svg",
              colorFilter: ColorFilter.mode(
                _index == 0 ? Color(0xFF15B86C) : Color(0xFFFFFCFC),
                BlendMode.srcIn,
              ),
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/images/tasks_icon.svg",colorFilter: ColorFilter.mode(
              _index == 1 ? Color(0xFF15B86C) : Color(0xFFFFFCFC),
              BlendMode.srcIn,
            ),),
            label: "To Do",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/images/Completed_tasks_icon.svg",colorFilter: ColorFilter.mode(
              _index == 2 ? Color(0xFF15B86C) : Color(0xFFFFFCFC),
              BlendMode.srcIn,
            ),),
            label: "Completed",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/images/profile_icon.svg",colorFilter: ColorFilter.mode(
              _index == 3 ? Color(0xFF15B86C) : Color(0xFFFFFCFC),
              BlendMode.srcIn,
            ),),
            label: "Profile",
          ),
        ],
      ),
      body: _widgets[_index],
    );
  }
}
