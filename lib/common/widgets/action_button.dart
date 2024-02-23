import 'package:flutter/material.dart';
import 'package:todo_list/common/constants/app_colors.dart';
import 'package:todo_list/common/constants/app_text_style.dart';

class ActionButton extends StatelessWidget {
  final VoidCallback onTap;
  final String? text;
  final IconData? icon;

  const ActionButton({
    super.key,
    required this.onTap,
    this.text,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.buttonBackground,
        padding: const EdgeInsets.all(8.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
        )
      ),
      onPressed: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if(icon != null) Icon(icon, color: AppTextStyle.option.color),
          if(icon != null && text != null) const SizedBox(width: 5),
          if(text != null) Text(text ?? '',
           style: AppTextStyle.option,
          ),
        ],
      ),
    );
  }
}