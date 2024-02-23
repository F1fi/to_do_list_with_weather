import 'package:flutter/material.dart' show IconData, Icons;

enum TaskType{
  work(Icons.work),
  life(Icons.home),
  hobby(Icons.sports_bar),
  other(Icons.more_horiz);

  final IconData icon;

  const TaskType(this.icon);

  factory TaskType.fromString(String text){
    final type = TaskType.values.where((e) => e.toString() == text).firstOrNull;

    return type ?? other;
  }
}