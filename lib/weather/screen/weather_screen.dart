import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/common/constants/app_strings.dart';
import 'package:todo_list/common/widgets/scaffold/app_scaffold.dart';
import 'package:todo_list/weather/bloc/weather_bloc.dart';
import 'package:todo_list/weather/bloc/weather_event.dart';
import 'package:todo_list/weather/bloc/weather_state.dart';
import 'package:todo_list/weather/widgets/weather_item.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {

  @override
  void initState() {
    super.initState();

    context.read<WeatherBloc>().add(InitWeatherData());
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: AppStrings.weather,
      child: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if(state is! LoadedState) return const Center(child: CircularProgressIndicator());

          return Center(
            child: WeatherItem(weather: state.weather),
          );
        },
      ),
    );
  }
}