import 'package:flutter/material.dart';
import 'package:todo_list/common/constants/app_colors.dart';
import 'package:todo_list/to_do_list/widgets/filter/filter_cell.dart';
import 'package:todo_list/to_do_list/widgets/filter/filter_option_button.dart';

class FilterSelector<T extends Object?> extends StatefulWidget {
  final String title;
  final Map<String, T> titleValueMap;
  final T initialValue;
  final void Function(T?) onChange;

  const FilterSelector({
    super.key,
    required this.title,
    required this.titleValueMap,
    required this.initialValue,
    required this.onChange,
  });

  @override
  State<FilterSelector> createState() => _FilterSelectorState<T>();
}

class _FilterSelectorState<T extends Object?> extends State<FilterSelector<T>> {
  static const _cellBorder = Border(right: BorderSide(color: AppColors.black));
  static const _radius = BorderRadius.all(Radius.circular(10));
  static const _lastOptionRadius = BorderRadius.horizontal(right: Radius.circular(10));

  T? _selectedValue;

  @override
  void initState() {
    super.initState();

    _selectedValue = widget.initialValue;
  }


  @override
  Widget build(BuildContext context) {
    final titles = widget.titleValueMap.keys;


    return Container(
      decoration: BoxDecoration(
        borderRadius: _radius,
        border: Border.all(color: AppColors.black),
        color: AppColors.filterSelectorBackground,
      ),
      clipBehavior: Clip.hardEdge,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FilterCell(
            text: '${widget.title}:',
            border: _cellBorder,
          ),
          ...titles.map((title) => FilterOptionButton<T?>(
            text: title,
            selectedOption: _selectedValue,
            option: widget.titleValueMap[title],
            onTap: _changeOption,
            border: titles.last != title ? _cellBorder : null,
            radius: titles.last != title ? null : _lastOptionRadius,
          )),
        ],
      ),
    );
  }

  void _changeOption(T? value){
    if(_selectedValue == value) return;

    setState(() => _selectedValue = value);

    widget.onChange(value);
  }
}