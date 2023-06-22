import 'dart:collection';
import 'task.dart';
import 'package:flutter/material.dart';



class TaskData extends ChangeNotifier{

  final List<Task> _tasks = [
    Task(name: 'Buy Milk' ),
    Task(name: 'Buy bread' ),
    Task(name: 'Buy jam' ),
  ];



  UnmodifiableListView <Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get taskCount {
    return _tasks.length;
  }

  void addTask(String newTaskTitle){
    final task = Task(name: newTaskTitle);
    _tasks.add(task);
    notifyListeners();
  }

  void updateTask(Task task){
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
