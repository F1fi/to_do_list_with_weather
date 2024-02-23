import 'package:flutter/material.dart';
import 'package:todo_list/common/routes/route.dart';
import 'package:todo_list/common/widgets/bloc_injection_container.dart';
import 'package:todo_list/common/widgets/repository_injection_container.dart';
import 'package:todo_list/to_do_list/screen/to_do_list_screen.dart';
import 'package:todo_list/weather/screen/weather_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryInjectionContainer(
      child: BlocInjectionContainer(
        child: MaterialApp(
          routes: {
            AppRoute.toDo : (_) => const ToDoListScreen(),
            AppRoute.weather : (_) => const WeatherScreen(),
          },
          initialRoute: AppRoute.toDo,
        ),
      ),
    );
  }
}