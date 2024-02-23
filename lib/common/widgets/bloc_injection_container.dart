import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/to_do_list/bloc/to_do_bloc.dart';
import 'package:todo_list/to_do_list/repository/to_do_repository.dart';
import 'package:todo_list/weather/bloc/weather_bloc.dart';
import 'package:todo_list/weather/repository/weather_repository.dart';

class BlocInjectionContainer extends StatelessWidget {
  final Widget child;

  const BlocInjectionContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ToDoBloc>(
          create: (context) => ToDoBloc(repository: context.read<ToDoRepository>()),
        ),
        BlocProvider<WeatherBloc>(
          create: (context) => WeatherBloc(context.read<WeatherRepository>()),
        ),
      ],
      child: child,
    );
  }
}