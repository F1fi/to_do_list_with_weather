import 'package:todo_list/to_do_list/model/filter_option.dart';
import 'package:todo_list/to_do_list/model/task.dart';

sealed class ToDoEvent{}

class InitTaskList extends ToDoEvent{}

class AddTask extends ToDoEvent{
  final Task task;

  AddTask(this.task);
}

class RemoveTask extends ToDoEvent{
  final int id;

  RemoveTask(this.id);
}

class UpdateTask extends ToDoEvent{
  final Task task;

  UpdateTask(this.task);
}

class SetFilter extends ToDoEvent{
  final TaskFilter option;

  SetFilter(this.option);
}
