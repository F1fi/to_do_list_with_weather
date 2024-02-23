import 'package:flutter/material.dart';
import 'package:todo_list/common/constants/app_strings.dart';
import 'package:todo_list/common/constants/app_text_style.dart';
import 'package:todo_list/to_do_list/widgets/feature_title.dart';

class TaskDescription extends StatelessWidget {
  final String text;

  const TaskDescription({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return FeatureTitle(
      title: '${AppStrings.description}:',
      child:  Text(text, style: AppTextStyle.option, maxLines: 3),
    );
  }
}