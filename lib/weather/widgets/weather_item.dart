import 'package:flutter/material.dart';
import 'package:todo_list/common/constants/app_colors.dart';
import 'package:todo_list/common/constants/app_strings.dart';
import 'package:todo_list/common/constants/app_text_style.dart';
import 'package:todo_list/to_do_list/widgets/feature_title.dart';
import 'package:todo_list/weather/model/weather.dart';
import 'package:todo_list/weather/widgets/temp_description.dart';
import 'package:todo_list/weather/widgets/row_with_icon_value_items.dart';

class WeatherItem extends StatelessWidget {
  final Weather weather;

  const WeatherItem({
    super.key,
    required this.weather,
  });

  @override
  Widget build(BuildContext context) {
    final Map<IconData, String> weatherInformationPair = {
      Icons.speed: weather.pressure.toString(),
      Icons.remove_red_eye_outlined:  weather.visibility.toString(),
      Icons.water_drop_sharp: weather.humidity.toString(),
    };

    final Map<IconData, String> windInformationPair = {
      Icons.wind_power: weather.wind.speed.toString(),
      Icons.multitrack_audio_sharp: weather.wind.gust.toString(),
      Icons.line_axis: weather.wind.degrees.toString(),
    };

    return Container(
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.all(Radius.circular(10))
      ),
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FeatureTitle(
            title: AppStrings.title,
            child: Text(weather.title, style: AppTextStyle.title),
          ),
          FeatureTitle(
            title: AppStrings.description,
            child: Text(
              '${weather.description.substring(0, 1).toUpperCase()}${weather.description.substring(1)}',
              style: AppTextStyle.option,
            ),
          ),
          RowWithIconValueItems(iconValueMap: weatherInformationPair),
          TempDescription(weather: weather),
          RowWithIconValueItems(iconValueMap: windInformationPair),
        ],
      ),
    );
  }
}