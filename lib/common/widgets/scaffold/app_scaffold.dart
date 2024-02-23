import 'package:flutter/material.dart';
import 'package:todo_list/common/constants/app_colors.dart';
import 'package:todo_list/common/widgets/scaffold/app_drawer.dart';
import 'package:todo_list/common/widgets/scaffold/custom_app_bar.dart';
import 'package:todo_list/to_do_list/widgets/add_task_button.dart';

class AppScaffold extends StatelessWidget {
  final bool isPlusVisible;
  final String title;
  final Widget child;

  const AppScaffold({
    super.key,
    this.isPlusVisible = false,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      floatingActionButton: isPlusVisible?
        const AddTaskButton() : null,
      drawer: const AppDrawer(),
      body: Column(
        children: [
          CustomAppBar(title: title),
          Expanded(child: child),
        ],
      ),
    );
  }
}