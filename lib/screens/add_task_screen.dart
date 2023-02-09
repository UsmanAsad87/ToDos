import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/constants.dart';
import 'package:todoey_flutter/models/task_data.dart';
import 'package:todoey_flutter/screens/database_helper.dart';

class addTaskScreen extends StatelessWidget {




  @override
  Widget build(BuildContext context) {
    String newTaskTitle="";
    return Container(
          color: const Color(0xff757575),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 60.0),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),

              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children:   [
                 Text(
                  "Add Task",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize:30.0,
                    color: kPrimaryColor,
                  ),
                ),
                TextField(
                  autofocus: true,
                  textAlign: TextAlign.center,
                  onChanged: (newText){
                    newTaskTitle=newText;
                  },
                  decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: '',
                  contentPadding:
                  const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: kPrimaryColor),
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                ),
                 TextButton(
                   //here flat button in course
                    style: TextButton.styleFrom(
                      backgroundColor: kPrimaryColor,
                      //textStyle: const TextStyle(color: Colors.white),
                      ),
                  onPressed: () {
                     context.read<TaskData>().addTask(newTaskTitle: newTaskTitle);
                     // Provider.of<TaskData>(context).addTask(newTaskTitle);
                      Navigator.pop(context);
                  },

                  child: const Text(
                      'Add',
                      style: TextStyle(color: Colors.white),
                    ),
                ),

              ],
            ),
          ),

    );
  }
}
