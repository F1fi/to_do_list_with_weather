import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/weather/bloc/weather_event.dart';
import 'package:todo_list/weather/bloc/weather_state.dart';
import 'package:todo_list/weather/repository/weather_repository.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState>{
  final WeatherRepository _repository;

  bool _isInitialized = false;

  WeatherBloc(this._repository): super(LoadingState()){
    on<InitWeatherData>((event, emit) async{
      if(_isInitialized) return;

      emit(LoadingState());
      final weather = await _repository.getWeather();
      emit(LoadedState(weather));
      
      _isInitialized = true;
    });
  }
}