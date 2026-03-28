import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tasky/models/task_model.dart';
import 'package:tasky/screens/home_screen.dart';

class AddTask extends StatefulWidget {
  AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  bool isHighPriority = false;
  final _key = GlobalKey<FormState>();
/// TODO we should make dispose controller
  final taskNameController = TextEditingController();

  final taskDescriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text("New Task"),
        titleTextStyle: TextStyle(color: Color(0XFFFFFCFC), fontSize: 20),
        backgroundColor: Color(0xFF181818),
        iconTheme: IconThemeData(color: Color(0XFFFFFCFC)),
      ),
      backgroundColor: Color(0xFF181818),
      body: Form(
        key: _key,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Task Name",
                          style: TextStyle(
                            color: Color(0XFFFFFFFF),
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      TextFormField(
                        validator: (value) {
                          if ((value ?? "").trim().isEmpty) {
                            return "please don't enter empty task ";
                          }
                        },
                        controller: taskNameController,
                        style: TextStyle(color: Color(0XFFFFFFFF)),
                        decoration: InputDecoration(
                          fillColor: Color(0XFF282828),
                          filled: true,
                          hintText: "school note",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Full Description",
                          style: TextStyle(
                            color: Color(0XFFFFFFFF),
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      TextFormField(
                        maxLines: 5,
                        validator: (value) {
                          if ((value ?? "").trim().isEmpty) {
                            return "please don't enter emty task description ";
                          }
                        },
                        controller: taskDescriptionController,
                        style: TextStyle(color: Color(0XFFFFFFFF)),
                        decoration: InputDecoration(
                          fillColor: Color(0XFF282828),
                          filled: true,
                          hintText:
                          "first we take an arabic lesson \n second play football \n third make a puzzle ",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "High Priority  ",
                            style: TextStyle(
                              color: Color(0XFFFFFFFF),
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                          Switch(
                            value: isHighPriority,
                            onChanged: (bool value) {
                              setState(() {
                                isHighPriority = value;
                              });
                            },
                            activeTrackColor: Color(0XFF15B86C),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ElevatedButton.icon(
                  onPressed: ()  async {
                    var sharedPref =await SharedPreferences.getInstance();
                    if (_key.currentState!.validate()) {
                      // final taskDetails = <String , dynamic>{
                      //   "taskNameControllerText" :taskNameController.text,
                      //   "taskDescriptionControllerText" : taskDescriptionController.text,
                      //   "isHighPriority" :isHighPriority
                      // };
                      final taskDetails =TaskModel(taskName: taskNameController.text, taskDescription: taskDescriptionController.text, isHighPriority: isHighPriority).toJson();
                      List<dynamic> taskList =[];
                      if(sharedPref.getString("tasksAfterEncode") != null){
                            taskList =jsonDecode(sharedPref.getString("tasksAfterEncode")!);
                      }
                      taskList.add(taskDetails);
                      var tasksAfterEncode =jsonEncode(taskList);
                      await sharedPref.setString("tasksAfterEncode", tasksAfterEncode);
                      print(sharedPref.getString("tasksAfterEncode"));
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                      //Navigator.pop(context);
                    }

                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(double.maxFinite, 42),
                    backgroundColor: Color(0XFF15B86C),
                    foregroundColor: Color(0XFFFFFFFF),
                  ),
                  icon: Icon(Icons.add),
                  label: Text("Add Task"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
