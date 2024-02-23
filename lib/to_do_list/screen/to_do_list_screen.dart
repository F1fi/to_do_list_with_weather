import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/common/constants/app_strings.dart';
import 'package:todo_list/common/widgets/scaffold/app_scaffold.dart';
import 'package:todo_list/to_do_list/bloc/to_do_bloc.dart';
import 'package:todo_list/to_do_list/bloc/to_do_event.dart';
import 'package:todo_list/to_do_list/bloc/to_do_state.dart';
import 'package:todo_list/to_do_list/widgets/filter/task_filters.dart';
import 'package:todo_list/to_do_list/widgets/to_do_list_view.dart';

class ToDoListScreen extends StatefulWidget {
  const ToDoListScreen({super.key});

  @override
  State<ToDoListScreen> createState() => _ToDoListScreenState();
}

class _ToDoListScreenState extends State<ToDoListScreen> {

  @override
  void initState() {
    super.initState();

    context.read<ToDoBloc>().add(InitTaskList());
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      isPlusVisible: true,
      title: AppStrings.toDoList,
      child: BlocBuilder<ToDoBloc, ToDoState>(
        builder: (context, state) {
          if(state == LoadingListState()) return const Center(child: CircularProgressIndicator());
      
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
                child: TaskFilters(),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ToDoListView(taskList: context.read<ToDoBloc>().taskList),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}