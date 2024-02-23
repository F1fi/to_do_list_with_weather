import 'package:todo_list/to_do_list/model/task_type.dart';

class TaskFilter{
  final TaskType? type;
  final bool? isAchieved;

  const TaskFilter({this.isAchieved, this.type});
}