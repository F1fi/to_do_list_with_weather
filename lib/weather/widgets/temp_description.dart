import 'package:flutter/material.dart';
import 'package:todo_list/common/constants/app_strings.dart';
import 'package:todo_list/common/constants/app_text_style.dart';
import 'package:todo_list/weather/model/weather.dart';

class TempDescription extends StatelessWidget {
  final Weather weather;

  const TempDescription({
    super.key,
    required this.weather,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('${AppStrings.temperature}:', style: AppTextStyle.option),
        Padding(
          padding: const EdgeInsets.only(left: 4.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${AppStrings.current}: ${weather.temp.toStringAsFixed(1)}',
                style: AppTextStyle.option,
              ),
              Text(
                '${AppStrings.feels}: ${weather.feelsTemp.toStringAsFixed(1)}',
                style: AppTextStyle.option,
              ),
              Text(
                '${AppStrings.max}: ${weather.maximalTemp.toStringAsFixed(1)}',
                style: AppTextStyle.option,
              ),
              Text(
                '${AppStrings.min}: ${weather.minimalTemp.toStringAsFixed(1)}',
                style: AppTextStyle.option,
              ),
            ],
          ),
        ),
      ],
    );
  }
}