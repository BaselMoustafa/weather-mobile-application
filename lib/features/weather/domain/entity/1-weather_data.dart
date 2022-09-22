import 'package:equatable/equatable.dart';
import 'package:weather_app/features/weather/domain/entity/2-current_weather.dart';
import 'package:weather_app/features/weather/domain/entity/3-forcast.dart';

class WeatherData extends Equatable{
  final String regionName;
  final String countryName;
  final CurrentWeather currentWeather;
  final List<Forecast> forecasetDays;
  const WeatherData({
    required this.regionName,
    required this.countryName,
    required this.currentWeather,
    required this.forecasetDays,
  });
  
  
  List<Object?> get props =>[
    regionName,
    countryName,
    currentWeather,
    forecasetDays,
  ];

}