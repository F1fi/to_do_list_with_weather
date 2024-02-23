import 'package:flutter/material.dart' show TextStyle, FontWeight;
import 'package:todo_list/common/constants/app_colors.dart';

class AppTextStyle{
  static const title = TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: AppColors.black, height: 1);
  static const subtitle = TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: AppColors.black, height: 1);
  static const option = TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: AppColors.black, height: 1);
  static const plusButton = TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: AppColors.white);
  static const appBarTitle = TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: AppColors.white);
}