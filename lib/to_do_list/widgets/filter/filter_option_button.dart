import 'package:flutter/material.dart';
import 'package:todo_list/common/constants/app_colors.dart';
import 'package:todo_list/to_do_list/widgets/filter/filter_cell.dart';

class FilterOptionButton<T extends Object?> extends StatelessWidget {
  final String text;
  final void Function(T) onTap;
  final T selectedOption;
  final T option;
  final Border? border;
  final BorderRadius? radius;

  const FilterOptionButton({
    super.key,
    required this.text,
    required this.onTap,
    required this.selectedOption,
    required this.option,
    this.border,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = selectedOption == option;

    return InkWell(
      onTap: () => onTap(option),
      child: FilterCell(
        text: text,
        backgroundColor: isSelected ? AppColors.white : AppColors.filterSelectorBackground,
        border: border,
        radius: radius,
      ),
    );
  }
}