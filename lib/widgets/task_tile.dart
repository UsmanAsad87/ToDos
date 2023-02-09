
import 'package:flutter/material.dart';
import 'package:todoey_flutter/constants.dart';
class TaskTile extends StatelessWidget {
  late bool isChecked ;
  late String taskTitle ;
  late Function(bool?) checkboxCallback;
  late Function()? longPressCallback;

  TaskTile({this.isChecked =false,this.taskTitle="None",required this.checkboxCallback,this.longPressCallback});

  @override
  Widget build(BuildContext context) {
    return  ListTile(
      onLongPress: longPressCallback,
      title:  Text(
          taskTitle ,
          style: TextStyle(
            decoration: isChecked? TextDecoration.lineThrough :null
          ),
      ),
      trailing: Checkbox(
        activeColor: kPrimaryColor,
        value: isChecked,
        onChanged: checkboxCallback,
        //toggleCheckboxState,
      ),
    );
  }
}

