import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/common/constants/app_strings.dart';
import 'package:todo_list/common/widgets/action_button.dart';
import 'package:todo_list/to_do_list/bloc/to_do_bloc.dart';
import 'package:todo_list/to_do_list/bloc/to_do_event.dart';
import 'package:todo_list/to_do_list/model/task.dart';
import 'package:todo_list/to_do_list/model/task_type.dart';
import 'package:todo_list/to_do_list/widgets/bottomSheet/task_form_bottom_sheet.dart';

class AddTaskBottomSheet extends StatefulWidget {
  const AddTaskBottomSheet({super.key});

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  TaskType type = TaskType.work;

  @override
  Widget build(BuildContext context) {
    return  TaskFormBottomSheet(
      titleController: titleController,
      descriptionController: descriptionController,
      initialType: type,
      onSelectType: (type) => this.type = type,
      underFieldWidget: Align(
        alignment: Alignment.centerRight,
        child: ActionButton(
          onTap: _onTap,
          text: AppStrings.create,
        ),
      ),
    );
  }

  Future<void> _onTap() async{
    final title = titleController.text.trim();
    final description = descriptionController.text.trim();
    if(title.isEmpty || description.isEmpty) return;

    final task = Task(
      title: title,
      date: DateTime.now(),
      type: type,
      description: description,
      isAchieved: false,
    );
    context.read<ToDoBloc>().add(AddTask(task));

    Navigator.pop(context);
  }
}