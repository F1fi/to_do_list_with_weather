import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/to_do_list/repository/to_do_repository.dart';
import 'package:todo_list/weather/repository/weather_repository.dart';

class RepositoryInjectionContainer extends StatelessWidget {
  final Widget child;

  const RepositoryInjectionContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<ToDoRepository>(create: (_) => ToDoRepository()),
        RepositoryProvider<WeatherRepository>(create: (_) => WeatherRepository()),
      ],
      child: child,
    );
  }
}