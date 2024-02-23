import 'package:flutter/material.dart';
import 'package:todo_list/common/constants/app_text_style.dart';

class IconWithText extends StatelessWidget {
  final IconData icon;
  final String text;

  const IconWithText({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(icon),
        Text(text, style: AppTextStyle.option)
      ],
    );
  }
}