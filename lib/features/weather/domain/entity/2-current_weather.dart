import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class CurrentWeather extends Equatable{
  final String lastUpdate;
  dynamic temp;
  dynamic windSpeed;
  final String windDirection;
  dynamic humidity;
  final String description;
  final String icon;

  CurrentWeather({
    required this.lastUpdate,
    required this.temp,
    required this.windSpeed,
    required this.windDirection,
    required this.humidity,
    required this.description,
    required this.icon,
  });
  
  
  List<Object?> get props => [
    lastUpdate,
    temp,
    windSpeed,
    windDirection,
    humidity,
    description,
    icon,
  ];
}