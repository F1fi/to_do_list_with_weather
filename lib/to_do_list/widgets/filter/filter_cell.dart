import 'package:flutter/material.dart';
import 'package:todo_list/common/constants/app_text_style.dart';

class FilterCell extends StatelessWidget {
  final String text;
  final Color? backgroundColor;
  final Border? border;
  final BorderRadius? radius;

  const FilterCell({
    super.key,
    required this.text,
    this.backgroundColor,
    this.border,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: border,
        borderRadius: radius,
        color: backgroundColor,
      ),
      padding: const EdgeInsets.all(8.0),
      child: Text(text, style: AppTextStyle.option),
    );
  }
}