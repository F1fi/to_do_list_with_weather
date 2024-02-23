import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_list/common/constants/app_strings.dart';
import 'package:todo_list/common/constants/app_text_style.dart';
import 'package:todo_list/to_do_list/model/task.dart';

class TaskBaseInformation extends StatelessWidget {
  final Task task;

  const TaskBaseInformation({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    final date = DateFormat.yMd().format(task.date);
    final time = DateFormat.Hm().format(task.date);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(task.title, style: AppTextStyle.option,),
        Text('${AppStrings.date}: $date', style: AppTextStyle.option,),
        Text('${AppStrings.time}: $time', style: AppTextStyle.option,),
      ],
    );
  }
}