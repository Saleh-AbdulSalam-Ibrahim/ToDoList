import 'package:flutter/foundation.dart';
import 'package:todolist/main.dart';
import 'package:todolist/models/task.dart';
import 'dart:collection';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    // Task(titleOfTask: 'Complete Flutter Bootcamp Course'),
    // Task(titleOfTask: 'Buy a RAM DDR4 2400Hz 8GB'),
    // Task(titleOfTask: 'Design some of screens to my app'),
  ];
  int get getCount {
    return _tasks.length;
  }

  void insertIntoDatabase(Task task) {
    //add function
    dbHelper.insertTask(task);
  }

  UnmodifiableListView<Task> get tasks {
    retrieveTasks();
    return UnmodifiableListView(_tasks);
  }

  void addTask(String newTaskTitle) {
    _tasks.add(Task(title: newTaskTitle));
    insertIntoDatabase(Task(title: newTaskTitle));
    retrieveTasks();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    dbHelper.deleteTask((task.title));
    notifyListeners();
  }

  void updateTaskState(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void retrieveTasks() async {
    _tasks = await dbHelper.allTasks();
  }
}
