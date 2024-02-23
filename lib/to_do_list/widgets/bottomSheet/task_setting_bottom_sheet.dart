import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/common/constants/app_strings.dart';
import 'package:todo_list/common/widgets/action_button.dart';
import 'package:todo_list/to_do_list/bloc/to_do_bloc.dart';
import 'package:todo_list/to_do_list/bloc/to_do_event.dart';
import 'package:todo_list/to_do_list/model/task.dart';
import 'package:todo_list/to_do_list/model/task_type.dart';
import 'package:todo_list/to_do_list/widgets/achieve_button.dart';
import 'package:todo_list/to_do_list/widgets/bottomSheet/task_form_bottom_sheet.dart';

class TaskSettingBottomSheet extends StatefulWidget {
  final Task task;

  const TaskSettingBottomSheet({super.key, required this.task});

  @override
  State<TaskSettingBottomSheet> createState() => _TaskSettingBottomSheetState();
}

class _TaskSettingBottomSheetState extends State<TaskSettingBottomSheet> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  TaskType _selectedType = TaskType.work;

  @override
  void initState() {
    super.initState();

    titleController.text = widget.task.title;
    descriptionController.text = widget.task.description;
    _selectedType = widget.task.type;
  }

  @override
  Widget build(BuildContext context) {
    return  TaskFormBottomSheet(
      titleController: titleController,
      descriptionController: descriptionController,
      initialType: _selectedType,
      onSelectType: (type) => _selectedType = type,
      underFieldWidget: 
        widget.task.id != null?
        Row(
          children: [
            AchieveButton(isAchieved: widget.task.isAchieved, onTap: _onChangeAchievement),
            const Spacer(),
            ActionButton(onTap: _onUpdate, text: AppStrings.update),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ActionButton(onTap: _onDelete, text: AppStrings.delete),
            ),
          ],
        )
        :
        null,
    );
  }

  Future<void> _onChangeAchievement() async{
    final id = widget.task.id;
    if(id == null) return;

    final newTask = widget.task.copyWith(isAchieved: !widget.task.isAchieved);

    context.read<ToDoBloc>().add(UpdateTask(newTask));

    Navigator.pop(context);
  }

  Future<void> _onUpdate() async{
    final id = widget.task.id;

    final title = titleController.text.trim();
    final description = descriptionController.text.trim();
    final isAnyFieldEmpty = title.isEmpty || description.isEmpty;
    
    final isChanged = 
      title != widget.task.title
      || widget.task.type != _selectedType
      || description != widget.task.description;
    
    if(id == null || isAnyFieldEmpty || !isChanged) return;

    final newTask = widget.task.copyWith(
      title: title,
      description: description,
      type: _selectedType,
    );

    context.read<ToDoBloc>().add(UpdateTask(newTask));

    Navigator.pop(context);
  }

  Future<void> _onDelete() async{
    final id = widget.task.id;
    if(id == null) return;

    context.read<ToDoBloc>().add(RemoveTask(id));

    Navigator.pop(context);
  }
}