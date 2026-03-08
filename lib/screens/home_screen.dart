import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'add_task.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  // printcreatState();
  printcreatState() {
    print("creat state start");
  }

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String name = "default";

  @override
  void initState() {
    print("we make intit state");
    getName();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("build start");
    return Scaffold(
      backgroundColor: const Color(0XFF181818),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddTask(),));
        },
        backgroundColor: Color(0xFF15B86C),
        foregroundColor: Color(0xFFFFFCFC),
        label: Text('Add New Task'),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        icon: Icon(Icons.add),
      ),
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
                  Column(
                    children: [
                      Text(
                        "Good Evening ,$name ",
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: Color(0XFFFFFCFC),
                        ),
                      ),
                      const Text(
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
              Text("Yuhuu , Your work Is\nalmost done !",style: TextStyle(
                color: Color(0XFFFFFCFC),
                fontSize: 32,fontWeight: FontWeight.w400
              ),)
            
            ],
          ),
        ),
      ),
    );
  }

  void getName() async {
    print("async start");
    final pref = await SharedPreferences.getInstance();
    setState(() {
      name = pref.getString("name") ?? "mistake";
    });
    print("async finish");
  }
}
