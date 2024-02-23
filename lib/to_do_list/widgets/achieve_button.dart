import 'package:flutter/material.dart';
import 'package:todo_list/common/constants/app_strings.dart';
import 'package:todo_list/common/widgets/action_button.dart';

class AchieveButton extends StatelessWidget {
  final bool isAchieved;
  final VoidCallback onTap;

  const AchieveButton({
    super.key,
    required this.isAchieved,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ActionButton(
      icon: isAchieved?
        Icons.check_box_outlined
        : Icons.check_box_outline_blank,
      text: isAchieved?
        AppStrings.achieved
        : AppStrings.achieve,
      onTap: onTap,
    );
  }
}