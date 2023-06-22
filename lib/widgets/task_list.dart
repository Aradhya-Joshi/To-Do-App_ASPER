import 'package:flutter/material.dart';
import '../models/task.dart';
import '../widgets/task_tile.dart';
import 'package:provider/provider.dart';
import '../models/task_data.dart';


class TaskList extends StatelessWidget {

  const TaskList({super.key, required List<Task> tasks});

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData,child){
        return ListView.builder(
          itemBuilder: (context, index){
          final task = taskData.tasks[index];
          return TaskTile(
            taskTitle: task.name.toString(),
            isChecked: task.isDone,
            checkboxCallback: (checkboxState){
              taskData.updateTask(task);
            },
            longPressCallback: (){
              taskData.deleteTask(task);
            },
          );
        },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}