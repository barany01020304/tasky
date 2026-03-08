import 'package:flutter/material.dart';

class AddTask extends StatelessWidget {
  AddTask({super.key});

  final _key = GlobalKey<FormState>();
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
                children: [
                  Text(
                    "High Priority  ",
                    style: TextStyle(
                      color: Color(0XFFFFFFFF),
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                  Spacer(),
                  Switch(
                    value: true,
                    onChanged: (bool value) {},
                    activeTrackColor: Color(0XFF15B86C),
                  ),
                ],
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ElevatedButton.icon(
                  onPressed: () async {
                    if (_key.currentState!.validate()) {}

                    //Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(double.maxFinite, 42),
                    backgroundColor: Color(0XFF15B86C),
                    foregroundColor: Color(0XFFFFFFFF),
                  ),
                    icon: Icon(Icons.add)
                  ,
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
