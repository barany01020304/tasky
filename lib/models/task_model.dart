class TaskModel {
  final String taskName;
  final String taskDescription;
  final bool isHighPriority;
   bool isDone;

  TaskModel({
    required this.taskName,
    required this.taskDescription,
    required this.isHighPriority,
    this.isDone =false
  });

  Map<String, dynamic> toJson() {
    return {
      "taskNameControllerText": taskName,
      "taskDescriptionControllerText": taskDescription,
      "isHighPriority": isHighPriority,
      "isDone" :isDone
    };
  }

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      taskName: json["taskNameControllerText"],
      taskDescription: json["taskDescriptionControllerText"],
      isHighPriority: json["isHighPriority"],
      isDone: json["isDone"],
    );
  }
}
