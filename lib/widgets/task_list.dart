import 'package:flutter/material.dart';
import 'package:todoey_flutter/widgets/task_tile.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task_data.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Consumer<TaskData>(
            builder: (context,taskData,child){
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                return TaskTile(
                    taskTitle: taskData.tasks[index].name,
                    isChecked: taskData.tasks[index].isDone,
                    checkboxCallback:(bool? checkboxState){
                      taskData.updateTask(taskData.tasks[index]);
                    },
                    longPressCallback: (){
                      taskData.deleteTask(taskData.tasks[index]);
                    },
                );
              },
                itemCount: taskData.tasks.length,
              );
            },

          ),
        ),
        Container(
            color:  Colors.white,
             height: 50,
           ),

      ],
    );
    /* return ListView(
      children:  [
        TaskTile(taskTitle: tasks[0].name,isChecked: tasks[0].isDone),
        TaskTile(taskTitle: tasks[1].name,isChecked: tasks[1].isDone),
        TaskTile(taskTitle: tasks[2].name,isChecked: tasks[2].isDone),
      ],
    );*/
  }
}
