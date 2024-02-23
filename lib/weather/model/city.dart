import 'package:todo_list/weather/scheme/city_scheme.dart';

class City{
  final String name;
  final double lat;
  final double lon;

  const City._({
    required this.name,
    required this.lat,
    required this.lon,
  });

  factory City.fromJson(Map<String, Object?> json){
    final name = json[CityScheme.name] as String;
    final lat = json[CityScheme.lat] as double;
    final lon = json[CityScheme.lon] as double;
    
    return City._(
      name: name,
      lat: lat,
      lon: lon,
    );
  }

  Map<String, Object?> toJson(){
    return {
      CityScheme.name: name,
      CityScheme.lat: lat,
      CityScheme.lon: lon,
    };
  }

}