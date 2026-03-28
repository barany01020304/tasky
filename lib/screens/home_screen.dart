import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tasky/models/task_model.dart';

import 'add_task.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String name = "default";
  bool isLoading = true;

  // List<bool> checkState = [];
  List<TaskModel> tasks = [];

  @override
  void initState() {
    print("we make intit state");
    getName();
    getTasks();
    //  checkState= List.filled(tasks.length, false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("build start");
    return Scaffold(


      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
        await  Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTask()),
          );
        getTasks();
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
              Text(
                "Yuhuu , Your work Is\nalmost done !",
                style: TextStyle(
                  color: Color(0XFFFFFCFC),
                  fontSize: 32,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 24),
              Align(
                alignment: AlignmentGeometry.topLeft,
                child: Text(
                  "My Tasks",
                  style: TextStyle(
                    color: Color(0XFFFFFCFC),
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(height: 16),
              Expanded(
                child:isLoading ?CircularProgressIndicator() : ListView.separated(
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 12,
                      ),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Color(0XFF282828),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Checkbox(
                            value: tasks[index].isDone,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            activeColor: Color(0XFF15B86C),
                            onChanged: (bool? value) async {
                              setState(() {
                                tasks[index].isDone = value ?? false;
                              });

                              final pref =
                                  await SharedPreferences.getInstance();
                              final currentTask = tasks.map((e) => e.toJson());
                              pref.setString(
                                "tasksAfterEncode",
                                jsonEncode(tasks),
                              );
                            },
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  tasks.isNotEmpty
                                      ? tasks[index].taskName
                                      : "no data",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    color: Color(0XFFFFFCFC),
                                    decoration: tasks[index].isDone
                                        ? TextDecoration.lineThrough
                                        : TextDecoration.none,
                                    decorationColor: Colors.white,
                                  ),
                                ),
                                Text(
                                  tasks.isNotEmpty
                                      ? tasks[index].taskDescription
                                      : "no data",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,

                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0XFFFFFCFC),
                                    decoration: tasks[index].isDone
                                        ? TextDecoration.lineThrough
                                        : TextDecoration.none,
                                    decorationColor: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.more_vert,
                              color: tasks[index].isDone
                                  ? Color(0XFFA0A0A0)
                                  : Color(0XFFFFFCFC),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  itemCount: tasks.length,
                  separatorBuilder: (BuildContext context, int index) =>
                      SizedBox(height: 8),
                ),
              ),
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
  }

  void getTasks() async {
    final pref = await SharedPreferences.getInstance();

    if (pref.getString("tasksAfterEncode") != null) {
      var taskAfterDecode =
          jsonDecode(pref.getString("tasksAfterEncode") ?? "mistake")
              as List<dynamic>;

        tasks = taskAfterDecode.map((element) {
          return TaskModel(
            taskName: element["taskNameControllerText"],
            taskDescription: element["taskDescriptionControllerText"],
            isHighPriority: element["isHighPriority"],
          );
        }).toList();
    //  await  Future.delayed(Duration(seconds: 1));
        setState(() async {
          tasks = taskAfterDecode.map((e) => TaskModel.fromJson(e)).toList();

          isLoading =false;
        });

    }
  }
}
