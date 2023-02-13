class Task {
  int taskId;
  String taskName;
  String taskDescription;
  DateTime dueDate;
  bool taskCompleted;

  Task(
      {required this.taskId,
      required this.taskName,
      this.taskDescription = '',
      required this.dueDate,
      this.taskCompleted = false});

  void toggleDone() {
    taskCompleted = !taskCompleted;
  }

  void setDueDate(DateTime date) {
    dueDate = date;
  }
}
