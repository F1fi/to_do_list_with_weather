import 'package:todo_list/weather/scheme/wind_scheme.dart';

class Wind{
  final double speed;
  final double gust;
  final int degrees;

  const Wind._({
    required this.speed,
    required this.gust,
    required this.degrees,
  });


  factory Wind.fromJson(Map<String, Object?> json){
    return Wind._(
      speed: json[WindScheme.speed] as double,
      gust: json[WindScheme.gust] as double,
      degrees: json[WindScheme.deg] as int,
    );
  }
}