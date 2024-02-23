import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/to_do_list/bloc/to_do_event.dart';
import 'package:todo_list/to_do_list/bloc/to_do_state.dart';
import 'package:todo_list/to_do_list/model/filter_option.dart';
import 'package:todo_list/to_do_list/model/task.dart';
import 'package:todo_list/to_do_list/repository/to_do_repository.dart';

class ToDoBloc extends Bloc<ToDoEvent, ToDoState>{
  final ToDoRepository _repository;
  final List<Task> _taskList = [];

  TaskFilter _filter = const TaskFilter();
  bool _isInitialized = false;

  List<Task> get taskList {
    final list = _taskList.reversed.toList();

    if(_filter.isAchieved != null){
      list.removeWhere((task) => task.isAchieved != _filter.isAchieved);
    }

    if(_filter.type != null){
      list.removeWhere((task) => task.type != _filter.type);
    }

    return list;
  }

  ToDoBloc({required repository}): _repository = repository, super(LoadedListState()) {
    on<InitTaskList>((event, emit) async{
      emit(LoadingListState());
      await _initList();
      emit(LoadedListState());
    });

    on<AddTask>((event, emit) async{
      emit(LoadingListState());
      await addTask(event.task);
      emit(LoadedListState());
    });

    on<UpdateTask>((event, emit) async{
      emit(LoadingListState());
      await _updateTask(event.task);
      emit(LoadedListState());
    });

    on<RemoveTask>((event, emit) async{
      emit(LoadingListState());
      await _removeTask(event.id);
      emit(LoadedListState());
    });

    on<SetFilter>((event, emit){
      if(event.option == _filter) return;
      emit(LoadingListState());
      _setFilter(event.option);
      emit(LoadedListState());
    });
  }

  Future<void> _initList() async{
    if(_isInitialized) return;

    _taskList.clear();
    final list = await _repository.loadAllTasks();
    _taskList.addAll(list);
    _isInitialized = true;
  }

  Future<void> addTask(Task task) async{
    if(!_isInitialized) return;

    final addedTask = await _repository.addTask(task);
    _taskList.add(addedTask);
  }

  Future<void> _updateTask(Task task) async{
    if(!_isInitialized) return;
    if(task.id == null) return;

    await _repository.updateTask(task);
    final index = _taskList.indexWhere((e) => e.id == task.id);
    _taskList[index] = task;
  }

  Future<void> _removeTask(int id) async{
    if(!_isInitialized) return;

    await _repository.removeTask(id);
    _taskList.removeWhere((task) => task.id == id);
  }

  void _setFilter(TaskFilter filter) => _filter = filter;
}