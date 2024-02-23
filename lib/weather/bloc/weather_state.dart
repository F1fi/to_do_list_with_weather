import 'package:todo_list/weather/model/weather.dart';

sealed class WeatherState{}

class LoadingState extends WeatherState{}

class LoadedState extends WeatherState{
  final Weather weather;

  LoadedState(this.weather);
}
