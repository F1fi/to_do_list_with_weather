import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list/to_do_list/model/task.dart';
import 'dart:convert';

class ToDoRepository{
  static const _listKey = 'ListKey';
  static const _newIdKey = 'newId';

  Future<List<Task>> loadAllTasks() async{
    final prefs = await SharedPreferences.getInstance();

    final stringList = prefs.getStringList(_listKey) ?? [];
    final taskList = stringList.map<Task>((e) => Task.fromJson(jsonDecode(e))).toList();

    return taskList;
  }

  Future<Task> addTask(Task task) async{
    final prefs = await SharedPreferences.getInstance();
    final id = prefs.getInt(_newIdKey) ?? 1;
    final newTask = task.copyWith(id: id);

    final stringList = prefs.getStringList(_listKey) ?? [];
    try{
    stringList.add(newTask.stringCode);
    await prefs.setStringList(_listKey, stringList);
    await prefs.setInt(_newIdKey, id + 1);
    }catch(e){
      print(e);
    }

    return newTask;
  }

  Future<Task> updateTask(Task task) async{
    final taskList = await loadAllTasks();
    final index = taskList.indexWhere((e) => e.id == task.id);

    final prefs = await SharedPreferences.getInstance();
    final stringList = prefs.getStringList(_listKey) ?? [];
    stringList[index] = task.stringCode;
    await prefs.setStringList(_listKey, stringList);

    return task;
  }

  Future<Task> removeTask(int taskId) async{
    final list = await loadAllTasks();
    final task = list.firstWhere((task) => task.id == taskId);

    final code = task.stringCode;

    final prefs = await SharedPreferences.getInstance();
    final taskCodeList = prefs.getStringList(_listKey) ?? [];
    taskCodeList.remove(code);
    await prefs.setStringList(_listKey, taskCodeList);

    return task;
  }
}