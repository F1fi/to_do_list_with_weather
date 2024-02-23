import 'package:flutter/material.dart';
import 'package:todo_list/common/constants/app_strings.dart';
import 'package:todo_list/to_do_list/model/task_type.dart';
import 'package:todo_list/to_do_list/widgets/type_selector/type_selector_cell.dart';

class TaskTypeSelector extends StatefulWidget {
  final TaskType initialType;
  final Function(TaskType) onSelectType;

  const TaskTypeSelector({
    super.key,
    required this.initialType,
    required this.onSelectType,
  });

  @override
  State<TaskTypeSelector> createState() => _TaskTypeSelectorState();
}

class _TaskTypeSelectorState extends State<TaskTypeSelector> {
  TaskType _selectedType = TaskType.work;

  @override
  void initState() {
    super.initState();

    _selectedType = widget.initialType;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TypeSelectorCell(
          text: AppStrings.work,
          type: TaskType.work,
          selectedType: _selectedType,
          onTap: _onSelect,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: TypeSelectorCell(
            text: AppStrings.life,
            type: TaskType.life,
            selectedType: _selectedType,
            onTap: _onSelect,
          ),
        ),
        TypeSelectorCell(
          text: AppStrings.hobby,
          type: TaskType.hobby,
          selectedType: _selectedType,
          onTap: _onSelect,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: TypeSelectorCell(
            text: AppStrings.other,
            type: TaskType.other,
            selectedType: _selectedType,
            onTap: _onSelect,
          ),
        ),
      ],
    );
  }

  void _onSelect(TaskType type){

    widget.onSelectType(type);
    setState(()=> _selectedType = type);
  }
}