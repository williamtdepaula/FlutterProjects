import 'package:app_todo/src/models/task.dart';
import 'package:flutter/material.dart';

class TaskData extends ChangeNotifier{
  List<Task> tasks = [];

  void addTask(Task task){
    this.tasks.add(task);
    notifyListeners();
  }

  void toggleTask(Task task){
    task.chageStateTask();
    notifyListeners();
  }

  void deleteTask(Task task){
    tasks.remove(task);
    notifyListeners();
  }
}