import 'package:flutter/material.dart';
import 'package:todo_list/common/constants/app_text_style.dart';

class FeatureTitle extends StatelessWidget {
  final String title;
  final Widget child;

  const FeatureTitle({
    super.key,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4.0, bottom: 4.0),
          child: Text(title, style: AppTextStyle.subtitle),
        ),
        child,
      ],
    );
  }
}