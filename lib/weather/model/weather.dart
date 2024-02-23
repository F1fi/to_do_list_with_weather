import 'package:todo_list/utils/temp_adapter.dart';
import 'package:todo_list/weather/model/wind.dart';
import 'package:todo_list/weather/scheme/weather_scheme.dart';
import 'package:todo_list/weather/scheme/wind_scheme.dart';

class Weather{
  final String title;
  final String description;
  final double minimalTemp;
  final double maximalTemp;
  final double temp;
  final double feelsTemp;
  final double pressure;
  final double humidity;
  final double visibility;
  final double cloudsChance;
  final Wind wind;

  const Weather._({
    required this.title,
    required this.description,
    required this.minimalTemp,
    required this.maximalTemp,
    required this.temp,
    required this.feelsTemp,
    required this.pressure,
    required this.humidity,
    required this.visibility,
    required this.cloudsChance,
    required this.wind,
  });

  factory Weather.fromJson(Map<String, Object?> json){
    final textMap = (json[WeatherScheme.textMap] as List)
      .first as Map<String, Object?>;
    final title = textMap[WeatherScheme.title] as String;
    final description = textMap[WeatherScheme.description] as String;

    final tempMap = json[WeatherScheme.tempInfo] as Map<String, Object?>;
    final temp = tempMap[WeatherScheme.temp] as double;
    final minTemp = tempMap[WeatherScheme.minTemp] as double;
    final maxTemp = tempMap[WeatherScheme.maxTemp] as double;
    final feelsTemp = tempMap[WeatherScheme.feelsTemp] as double;
    final pressure = tempMap[WeatherScheme.pressure] as int ;
    final humidity = tempMap[WeatherScheme.humidity] as int;

    final visibility = (json[WeatherScheme.visibility] as int) / 100;

    final cloudChance = (json[WeatherScheme.clouds] as Map<String, Object?>)
      [WeatherScheme.cloudChance] as int;
    
    final wind = Wind.fromJson(json[WindScheme.tableName] as Map<String, Object?>);

    return Weather._(
      title: title,
      description: description,
      minimalTemp: TempAdapter.fromKelvin(minTemp).celsius,
      maximalTemp: TempAdapter.fromKelvin(maxTemp).celsius,
      temp: TempAdapter.fromKelvin(temp).celsius,
      feelsTemp: TempAdapter.fromKelvin(feelsTemp).celsius,
      pressure: pressure / 100,
      humidity: humidity.toDouble(),
      visibility: visibility,
      cloudsChance: cloudChance.toDouble(),
      wind: wind,
    );
  }


}