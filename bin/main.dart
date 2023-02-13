// import 'dart:collection';
import 'dart:io';

import 'controller/task_controller.dart';
import 'model/task_model.dart';
import 'view/task_view.dart';

void main() {
  TaskController controller = TaskController();
  TaskView view = TaskView(controller);

  controller.addTask(Task(
      taskId: 32,
      taskName: 'Fazer compras',
      dueDate: DateTime.now().add(Duration(days: 2))));
  controller.addTask(Task(
      taskId: 232,
      taskName: 'Estudar Dart',
      dueDate: DateTime.now().add(Duration(days: 5))));
  controller.addTask(Task(
      taskId: 132,
      taskName: 'Lavar a louça',
      dueDate: DateTime.now().add(Duration(days: 1))));

  while (true) {
    view.displayTasks();
    print('\nEscolha uma opção:');
    print('1. Adicionar tarefa');
    print('2. Marcar tarefa como concluída');
    print('3. Excluir tarefa');
    print('4. Sair');

    String input = stdin.readLineSync()!;
    int? option = int.tryParse(input);

    if (option == 1) {
      // print("\x1B[1J");

      print('Insira o nome da tarefa:');
      String taskName = stdin.readLineSync()!;
      print('Insira a descrição da tarefa:');
      String taskDescription = stdin.readLineSync()!;
      print('Insira a data limite da tarefa (formato yyyy-mm-dd):');
      String dueDateInput = stdin.readLineSync()!;
      print(dueDateInput);
      DateTime dueDate = DateTime.tryParse(dueDateInput)!;
      controller.addTask(Task(
          taskId: 11,
          taskName: taskName,
          taskDescription: taskDescription,
          dueDate: dueDate,
          taskCompleted: false));
    } else if (option == 2) {
      print('Insira o número da tarefa:');
      String taskNumberInput = stdin.readLineSync()!;
      int? taskNumber = int.tryParse(taskNumberInput);
      if (taskNumber == null ||
          taskNumber < 1 ||
          taskNumber > controller.data.taskCount) {
        print('Tarefa inválida, tente novamente.');
        continue;
      }
      Task task = controller.data.tasks[taskNumber - 1];
      task.taskCompleted = true;
      controller.updateTask(task);
    } else if (option == 3) {
      print('Insira o número da tarefa:');
      String taskNumberInput = stdin.readLineSync()!;
      int? taskNumber = int.tryParse(taskNumberInput);
      if (taskNumber == null ||
          taskNumber < 1 ||
          taskNumber > controller.data.taskCount) {
        print('Tarefa inválida, tente novamente.');
        continue;
      }
      Task task = controller.data.tasks[taskNumber - 1];
      controller.deleteTask(task);
    } else if (option == 4) {
      break;
    }
  }

  if (Platform.isWindows) {
    // not tested, I don't have Windows
    // may not to work because 'cls' is an internal command of the Windows shell
    // not an executeable
    print(Process.runSync("cls", [], runInShell: true).stdout);
  } else {
    print(Process.runSync("clear", [], runInShell: true).stdout);
  }
}
