import 'package:flutter/material.dart';
import '../widgets/task_list.dart';
import '../screens/add_task_screen.dart';
import 'package:provider/provider.dart';
import '../models/task_data.dart';

TaskData T = TaskData() ;

class TaskScreen extends StatelessWidget {

  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
          child: const Icon(Icons.add,),
          onPressed: (){
          showModalBottomSheet(
            context: context,
            builder: (context) => const AddTaskScreen(),
          );
          },
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
            child: Column(
               mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30.0,
                  child: Icon(Icons.list,
                  size: 30.0,
                  color: Colors.lightBlueAccent,
                  ),
                ),
                const SizedBox(height: 10.0,),
                const Text(
                  'Todoey',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  '${Provider.of<TaskData>(context).taskCount} Tasks',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: TaskList(tasks: T.tasks,),
            ),)
        ],
      ),
    );
  }
}
