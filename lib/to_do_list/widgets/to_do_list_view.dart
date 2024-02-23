import 'package:flutter/material.dart';
import 'package:todo_list/to_do_list/model/task.dart';
import 'package:todo_list/to_do_list/widgets/task_item.dart';

class ToDoListView extends StatelessWidget {
  final List<Task> taskList;

  const ToDoListView({super.key, required this.taskList});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: taskList.length,
      itemBuilder: (context, index){
        final task = taskList[index];
    
        return TaskItem(task: task);
      },
      separatorBuilder: (_, __) => const SizedBox(height: 10),
    );
  }
}