import 'dart:convert';

import 'package:todo_list/to_do_list/model/task_type.dart';
import 'package:todo_list/to_do_list/scheme/task_model_scheme.dart';

class Task{
  final String title;
  final DateTime date;
  final TaskType type;
  final bool isAchieved;
  final String description;
  final int? id;

  String get stringCode => jsonEncode(toJson());

  Task({
    required this.title,
    required this.date,
    required this.type,
    required this.description,
    this.isAchieved = false,
    this.id,
  });

  factory Task.fromJson(Map<String, Object?> json){
    return Task(
      title: json[TaskModelScheme.title] as String,
      date: DateTime.parse(json[TaskModelScheme.date] as String),
      type: TaskType.fromString(json[TaskModelScheme.type] as String),
      isAchieved: json[TaskModelScheme.isAchieved] as bool,
      description: json[TaskModelScheme.description] as String,
      id: json[TaskModelScheme.id] as int?,
    );
  }

  Map<String, Object?> toJson(){
    return {
      TaskModelScheme.title: title,
      TaskModelScheme.date: date.toString(),
      TaskModelScheme.type: type.toString(),
      TaskModelScheme.isAchieved: isAchieved,
      TaskModelScheme.description: description,
      TaskModelScheme.id: id,
    };
  }

  Task copyWith({
    String? title,
    DateTime? date,
    TaskType? type,
    bool? isAchieved,
    String? description,
    int? id,
  }){
    return Task(
      title: title ?? this.title,
      date: date ?? this.date,
      type: type ?? this.type,
      isAchieved: isAchieved ?? this.isAchieved,
      description: description ?? this.description,
      id: id ?? this.id,
    );
  }
}