import 'package:flutter/material.dart';
import 'package:todo_list/common/constants/app_colors.dart';
import 'package:todo_list/common/constants/app_text_style.dart';

class CustomAppBar extends StatelessWidget {
  final String title;

  const CustomAppBar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      color: AppColors.appBarBackground,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(title, style: AppTextStyle.appBarTitle),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                padding: EdgeInsets.zero,
                onPressed: (){
                  Scaffold.of(context).openDrawer();
                },
                icon: const Icon(
                  Icons.menu, color:
                  AppColors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}