import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/to_do_list/bloc/to_do_bloc.dart';
import 'package:todo_list/to_do_list/bloc/to_do_event.dart';
import 'package:todo_list/to_do_list/model/task.dart';
import 'package:todo_list/to_do_list/widgets/achieve_button.dart';
import 'package:todo_list/to_do_list/widgets/bottomSheet/task_setting_bottom_sheet.dart';
import 'package:todo_list/to_do_list/widgets/task_base_information.dart';
import 'package:todo_list/to_do_list/widgets/task_description.dart';
import 'package:todo_list/to_do_list/widgets/task_icon.dart';

class TaskItem extends StatelessWidget {
  static const _padding = EdgeInsets.all(8);
  static const _borderRadius = 10.0;

  final Task task;

  const TaskItem({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => _openTaskSetting(context),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(_borderRadius),
        ),
        padding: _padding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: TaskIcon(type: task.type),
                ),
                TaskBaseInformation(task: task),
                const Spacer(),
                AchieveButton(
                  isAchieved: task.isAchieved,
                  onTap: () => _changeAchievements(context),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: TaskDescription(
                text: task.description,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _openTaskSetting(BuildContext context){
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      constraints: const BoxConstraints(),
      builder: (_) {
        return TaskSettingBottomSheet(task: task);
    });
  }

  void _changeAchievements(BuildContext context){
    context.read<ToDoBloc>().add(
      UpdateTask(task.copyWith(isAchieved: !task.isAchieved))
    );
  }
}