import 'package:equatable/equatable.dart';
import 'package:weather_app/features/weather/domain/entity/4-day.dart';
import 'package:weather_app/features/weather/domain/entity/5-astro.dart';
import 'package:weather_app/features/weather/domain/entity/6-hour_model.dart';

class Forecast extends Equatable{
  final String date;
  final Day dayData;
  final Astro astroData;
  final List<Hour>hours;
  const Forecast({
    required this.date,
    required this.dayData,
    required this.astroData,
    required this.hours,
  });
  
  List<Object?> get props =>[
    date,
    dayData,
    astroData,
    hours,
  ];
}