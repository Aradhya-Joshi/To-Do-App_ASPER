import 'package:flutter/material.dart';
import 'package:to_do_app/models/task_data.dart';
import 'package:provider/provider.dart';

String newtaskTitle = '';

class AddTaskScreen extends StatelessWidget {

  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {


    return Container(
      color: const Color(0xff757575),
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.0),
            topLeft: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Add Task',
            style: TextStyle(
              fontSize: 30.0,
              color: Colors.lightBlueAccent,
            ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (newText){
                newtaskTitle = newText.toString();
              },
            ),
            ElevatedButton(
              onPressed: (){
                Provider.of<TaskData>(context,listen: false).addTask(newtaskTitle);
                Navigator.pop(context);
            },
              child: const Text(
                  'Add',
                  style: TextStyle(
                    color: Colors.white,
              ),
            ),
            ),
          ],
        ),
      ),
    );
  }
}
