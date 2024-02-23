import 'package:flutter/material.dart';
import 'package:todo_list/common/constants/app_colors.dart';
import 'package:todo_list/common/constants/app_text_style.dart';
import 'package:todo_list/to_do_list/widgets/bottomSheet/add_task_bottom_sheet.dart';

class AddTaskButton extends StatelessWidget {
  const AddTaskButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: AppColors.activeColor,
      onPressed: () => _openBottomSheet(context),
      child: const Text('+', style: AppTextStyle.plusButton),
    );
  }

  void _openBottomSheet(BuildContext context){
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      constraints: const BoxConstraints(),
      builder: (_) {
        return const AddTaskBottomSheet();
    });
  }
}