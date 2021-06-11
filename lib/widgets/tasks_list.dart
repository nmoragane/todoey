import 'package:flutter/material.dart';
import 'tasks_tile.dart';
import 'package:provider/provider.dart';
import 'package:todoey/modal/task_data.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskdata, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return TaskTile(
              taskTitle: taskdata.tasks[index].name,
              isChecked: taskdata.tasks[index].isDone,
              checkboxCallback: (checkboxState) {
                taskdata.updateTask(taskdata.tasks[index]);
              },
              longPressCallback: () {
                taskdata.deleteTask(taskdata.tasks[index]);
              },
            );
          },
          itemCount: taskdata.taskCount,
        );
      },
    );
  }
}
