import '../controller/task_controller.dart';
import '../model/task_model.dart';

import 'package:intl/intl.dart';

class TaskView {
  final TaskController _controller;

  TaskView(this._controller);

  void displayTasks() {
    print('Tarefas:');
    for (int i = 0; i < _controller.data.taskCount; i++) {
      Task task = _controller.data.tasks[i];
      print(
          '${i + 1}. ${task.taskName} (${task.taskCompleted ? 'concluído' : 'pendente'}) - Vencimento: ${DateFormat.yMd().format(task.dueDate)}');
    }
  }
}
