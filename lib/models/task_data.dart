import 'package:flutter/foundation.dart';
import 'package:todolist/models/task.dart';
import 'dart:collection';

int counter = 0;

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(titleOfTask: 'Complete Flutter Bootcamp Course', id: ++counter),
    Task(titleOfTask: 'Buy a RAM DDR4 2400Hz 8GB', id: ++counter),
    Task(titleOfTask: 'Design some of screens to my app', id: ++counter),
  ];
  int get getCount {
    return _tasks.length;
  }

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  void addTask(String newTaskTitle) {
    _tasks.add(
      Task(titleOfTask: newTaskTitle, id: ++counter),
    );
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }

  void updateTaskState(Task task) {
    task.toggleDone();
    notifyListeners();
  }
}
