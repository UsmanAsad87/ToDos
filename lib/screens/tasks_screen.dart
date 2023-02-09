import 'package:flutter/material.dart';
import 'package:todoey_flutter/constants.dart';
import 'package:todoey_flutter/widgets/task_list.dart';
import 'package:todoey_flutter/screens/add_task_screen.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task_data.dart';
import 'package:todoey_flutter/screens/database_helper.dart';
import 'dart:collection';

import '../models/task.dart';

class TasksScreen extends StatefulWidget {
  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> with WidgetsBindingObserver {
  void createDB() async {
    List<Map<String, dynamic>> queryData =
        await DatabaseHelper.instance.queryAll();
    for (var i = 0; i < queryData.length; i++) {
      String title = queryData[i][DatabaseHelper.columnName];
      bool done =
          queryData[i][DatabaseHelper.columnCheck] == "1" ? true : false;
      context.read<TaskData>().addTask(
            newTaskTitle: title,
            isDone: done,
          );
    }
  }

  Future<void> writeDB() async {
    int i = await DatabaseHelper.instance.delete();
    UnmodifiableListView<Task> taskData = context.read<TaskData>().tasks;
    for (var i = 0; i < context.read<TaskData>().taskCount; i++) {
      String taskTitle = taskData[i].name;
      int done = taskData[i].isDone ? 1 : 0;
      await DatabaseHelper.instance.insert({
        DatabaseHelper.columnName: taskTitle,
        DatabaseHelper.columnCheck: done,
      });
    }
    return;
  }

  @override
  void initState() {
    createDB();
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
  }

  @override
  void dispose() async {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.inactive ||
        state == AppLifecycleState.detached) {
      return;
    }
    final isBackground = state == AppLifecycleState.paused;
    if (isBackground) {
      writeDB();
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => addTaskScreen(),
            );
          },
          backgroundColor: kPrimaryColor,
          child: Icon(Icons.add),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(
                  top: 60, left: 30, right: 30, bottom: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    child: Icon(
                      Icons.list,
                      size: 30.0,
                      color: kPrimaryColor,
                    ),
                    backgroundColor: Colors.white,
                    radius: 30.0,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Text(
                    'ToDos',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text('${Provider.of<TaskData>(context).taskCount} tasks',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      )),
                ],
              ),
            ),
            Expanded(
              child: Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                  ),
                  child: TasksList(),
                ),
              ),
            ),
            // Container(
            //   color:  Colors.white,
            //   height: 50,
            // ),
          ],
        ),
      ),
    );
  }
}
