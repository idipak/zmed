
class TaskListModel {
  final int status;
  final Tasks tasks;

  TaskListModel({
    required this.status,
    required this.tasks,
  });

  factory TaskListModel.fromJson(Map<String, dynamic> json) => TaskListModel(
    status: json["status"],
    tasks: Tasks.fromJson(json["tasks"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "tasks": tasks.toJson(),
  };
}

class Tasks {
  final TaskId taskId1;
  final TaskId taskId2;
  final TaskId taskId3;
  final TaskId taskId4;
  final TaskId taskId5;

  Tasks({
    required this.taskId1,
    required this.taskId2,
    required this.taskId3,
    required this.taskId4,
    required this.taskId5,
  });

  factory Tasks.fromJson(Map<String, dynamic> json) => Tasks(
    taskId1: TaskId.fromJson(json["task_id_1"]),
    taskId2: TaskId.fromJson(json["task_id_2"]),
    taskId3: TaskId.fromJson(json["task_id_3"]),
    taskId4: TaskId.fromJson(json["task_id_4"]),
    taskId5: TaskId.fromJson(json["task_id_5"]),
  );

  Map<String, dynamic> toJson() => {
    "task_id_1": taskId1.toJson(),
    "task_id_2": taskId2.toJson(),
    "task_id_3": taskId3.toJson(),
    "task_id_4": taskId4.toJson(),
    "task_id_5": taskId5.toJson(),
  };
}

class TaskId {
  final String task;
  final String assignee;
  final String assignedOn;
  final String assignedBy;
  final String assigneeRole;
  final String estimatedDays;
  final String currentStatus;
  final String dueDate;
  final String type;

  TaskId({
    required this.task,
    required this.assignee,
    required this.assignedOn,
    required this.assignedBy,
    required this.assigneeRole,
    required this.estimatedDays,
    required this.currentStatus,
    required this.dueDate,
    required this.type,
  });

  factory TaskId.fromJson(Map<String, dynamic> json) => TaskId(
    task: json["task"],
    assignee: json["assignee"],
    assignedOn: json["assigned_on"],
    assignedBy: json["assigned_by"],
    assigneeRole: json["assignee_role"],
    estimatedDays: json["estimated_days"],
    currentStatus: json["current_status"],
    dueDate: json["due_date"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "task": task,
    "assignee": assignee,
    "assigned_on": assignedOn,
    "assigned_by": assignedBy,
    "assignee_role": assigneeRole,
    "estimated_days": estimatedDays,
    "current_status": currentStatus,
    "due_date": dueDate,
    "type": type,
  };
}
