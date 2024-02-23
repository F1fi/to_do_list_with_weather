import 'package:flutter/material.dart';
import 'package:todo_list/to_do_list/widgets/feature_title.dart';

class TaskField extends StatelessWidget {
  final String title;
  final bool isEnable;
  final TextEditingController controller;

  const TaskField({super.key, required this.controller, required this.title, this.isEnable = true});

  @override
  Widget build(BuildContext context) {
    return FeatureTitle(
      title: title,
      child: TextFormField(
        controller: controller,
        enabled: isEnable,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}