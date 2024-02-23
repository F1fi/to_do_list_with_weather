import 'package:flutter/material.dart';
import 'package:todo_list/common/constants/app_colors.dart';
import 'package:todo_list/to_do_list/model/task_type.dart';

class TaskIcon extends StatelessWidget {
  final TaskType type;
  final Color? iconColor;
  final Color? backgroundColor;

  const TaskIcon({super.key, required this.type, this.iconColor, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.activeColor,
        shape: BoxShape.circle,
      ),
      width: 40,
      height: 40,
      child: Icon(type.icon, color: iconColor)
    );
  }
}