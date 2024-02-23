import 'package:flutter/material.dart';
import 'package:todo_list/common/constants/app_colors.dart';
import 'package:todo_list/common/constants/app_strings.dart';
import 'package:todo_list/common/routes/route.dart';
import 'package:todo_list/common/widgets/action_button.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0, vertical: 20.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ActionButton(
            onTap: () => _goToAnotherPage(context),
            text: AppStrings.anotherPage,
          ),
        ],
      ),
    );
  }

  void _goToAnotherPage(BuildContext context){
    final routeName = ModalRoute.of(context)?.settings.name;
    final navigator = Navigator.of(context);

    switch (routeName) {
      case AppRoute.toDo:
        navigator.pushReplacementNamed(AppRoute.weather);
      case AppRoute.weather:
        navigator.pushReplacementNamed(AppRoute.toDo);
      default:
        return;
    }
  }
}