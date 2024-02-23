import 'package:flutter/material.dart';
import 'package:todo_list/common/constants/app_strings.dart';
import 'package:todo_list/to_do_list/model/task_type.dart';
import 'package:todo_list/to_do_list/widgets/feature_title.dart';
import 'package:todo_list/to_do_list/widgets/task_filed.dart';
import 'package:todo_list/to_do_list/widgets/type_selector/task_type_selector.dart';

class TaskFormBottomSheet extends StatelessWidget {
  final TextEditingController titleController;
  final TextEditingController descriptionController;
  final Widget? underFieldWidget;
  final bool isFieldActive;
  final TaskType initialType;
  final Function(TaskType) onSelectType;

  const TaskFormBottomSheet({
    super.key,
    required this.titleController,
    required this.descriptionController,
    this.underFieldWidget,
    this.isFieldActive = true,
    required this.initialType,
    required this.onSelectType,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TaskField(
              title: '${AppStrings.title}:',
              controller: titleController,
              isEnable: isFieldActive,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: TaskField(
                title: '${AppStrings.description}:',
                controller: descriptionController,
                isEnable: isFieldActive,
              ),
            ),
            FeatureTitle(
              title: '${AppStrings.type}:',
              child: TaskTypeSelector(
                initialType: initialType,
                onSelectType: onSelectType,
              ),
            ),
            underFieldWidget != null ?
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: underFieldWidget,
            )
            :
            const SizedBox(),
          ],
        ),
      ),
    );
  }
}