import 'dart:collection';

import '../model/task_model.dart';

class TaskData {
  final List<Task> _tasks = [];
  int _lastId = 0;

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get taskCount {
    return _tasks.length;
  }

  void addTask(Task task) {
    task.taskId = _lastId + 1;
    _lastId = task.taskId;
    _tasks.add(task);
  }

  void updateTask(Task task) {
    int index = _tasks.indexWhere((element) => element.taskId == task.taskId);
    if (index >= 0) {
      _tasks[index] = task;
    }
  }

  void deleteTask(Task task) {
    _tasks.removeWhere((element) => element.taskId == task.taskId);
  }
}

class TaskController {
  final TaskData _data = TaskData();

  TaskData get data {
    return _data;
  }

  void addTask(Task task) {
    _data.addTask(task);
  }

  void updateTask(Task task) {
    _data.updateTask(task);
  }

  void deleteTask(Task task) {
    _data.deleteTask(task);
  }
}
