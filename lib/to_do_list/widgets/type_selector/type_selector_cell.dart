import 'package:flutter/material.dart';
import 'package:todo_list/common/constants/app_colors.dart';
import 'package:todo_list/common/constants/app_text_style.dart';
import 'package:todo_list/to_do_list/model/task_type.dart';
import 'package:todo_list/to_do_list/widgets/task_icon.dart';

class TypeSelectorCell extends StatelessWidget {
  static const _radius = BorderRadius.all(Radius.circular(10));
  static const _selectedBorder = Border.fromBorderSide(BorderSide(color: AppColors.black));
  static const _border = Border.fromBorderSide(BorderSide(color: AppColors.unselectedColor));


  final String text;
  final TaskType type;
  final TaskType selectedType;
  final void Function(TaskType) onTap;

  const TypeSelectorCell({
    super.key,
    required this.text,
    required this.type,
    required this.selectedType,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = selectedType == type;

    return InkWell(
      onTap: () => onTap(type),
      borderRadius: _radius,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: _radius,
          border: isSelected? _selectedBorder : _border,
          color: AppColors.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TaskIcon(
              type: type,
              iconColor: isSelected?
                AppColors.black : AppColors.white,
              backgroundColor: isSelected?
                AppColors.activeColor : AppColors.unselectedColor,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                text,
                style: AppTextStyle.option.copyWith(
                  color: isSelected ?null:AppColors.unselectedColor,
                  ),
                ),
            ),
          ],
        ),
      ),
    );
  }
}