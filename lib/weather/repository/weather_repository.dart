import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:todo_list/weather/model/city.dart';
import 'package:todo_list/weather/model/weather.dart';

class WeatherRepository{
  static const _apiKey = '75548ffa7b92571b4b38c7f96fd59e13';

  Future<Weather> getWeather() async{
    final city = await _getKyivData();
    final url = Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=${city.lat}&lon=${city.lon}&appid=$_apiKey');
    final response = await http.get(url);
    final json = jsonDecode(response.body) as Map<String, Object?>;
    final weather = Weather.fromJson(json);
    
    return weather;
  }

  Future<City> _getKyivData() async{
    final url = Uri.parse('http://api.openweathermap.org/geo/1.0/direct?q=Kyiv&limit=5&appid=$_apiKey');
    final response = await http.get(url);
    final json = jsonDecode(response.body) as List;
    final city = City.fromJson(json.first);

    return city;
  }
}