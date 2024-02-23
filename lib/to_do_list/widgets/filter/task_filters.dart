import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/common/constants/app_strings.dart';
import 'package:todo_list/common/constants/app_text_style.dart';
import 'package:todo_list/to_do_list/bloc/to_do_bloc.dart';
import 'package:todo_list/to_do_list/bloc/to_do_event.dart';
import 'package:todo_list/to_do_list/model/filter_option.dart';
import 'package:todo_list/to_do_list/model/task_type.dart';
import 'package:todo_list/to_do_list/widgets/filter/filter_selector.dart';

class TaskFilters extends StatefulWidget {
  const TaskFilters({super.key});

  @override
  State<TaskFilters> createState() => _TaskFiltersState();
}

class _TaskFiltersState extends State<TaskFilters> {
  static const _achievementTitleValueMap = {
    AppStrings.all: null,
    AppStrings.achieved: true,
    AppStrings.unachieved: false,
  };
  static const _typeTitleValueMap = {
    AppStrings.all: null,
    AppStrings.work: TaskType.work,
    AppStrings.life: TaskType.life,
    AppStrings.hobby: TaskType.hobby,
    AppStrings.other: TaskType.other,
  };

  TaskFilter _filter = const TaskFilter();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('${AppStrings.filters}:', style: AppTextStyle.option),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: FilterSelector<bool?>(
            title: AppStrings.achievements,
            initialValue: null,
            titleValueMap: _achievementTitleValueMap,
            onChange: _changeAchievement,
          ),
        ),
        FilterSelector<TaskType?>(
          title: AppStrings.types,
          initialValue: null,
          titleValueMap: _typeTitleValueMap,
          onChange: _changeType,
        ),
      ],
    );
  }

  void _changeAchievement(bool? value){
    if(_filter.isAchieved == value) return;

    _filter = TaskFilter(
      isAchieved: value,
      type: _filter.type,
    );
    
    context.read<ToDoBloc>().add(SetFilter(_filter));
  }

  void _changeType(TaskType? value){
    if(_filter.type == value) return;

    _filter = TaskFilter(
      isAchieved: _filter.isAchieved,
      type: value,
    );
    
    context.read<ToDoBloc>().add(SetFilter(_filter));
  }
}