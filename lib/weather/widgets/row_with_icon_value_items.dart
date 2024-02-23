import 'package:flutter/material.dart';
import 'package:todo_list/weather/widgets/icon_with_text.dart';

class RowWithIconValueItems extends StatelessWidget {
  final Map<IconData, String> iconValueMap;

  const RowWithIconValueItems({
    super.key,
    required this.iconValueMap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ...iconValueMap.keys.map((key){
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: IconWithText(
              icon: key,
              text: iconValueMap[key] ?? '',
            ),
          );
        }),
      ],
    );
  }
}