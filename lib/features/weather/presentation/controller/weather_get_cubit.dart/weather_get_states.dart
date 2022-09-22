import 'package:weather_app/features/weather/domain/entity/2-current_weather.dart';
import 'package:weather_app/features/weather/domain/entity/3-forcast.dart';

abstract class WeatherGetCubitStates{}

class WeatherGetCubitInitialState extends WeatherGetCubitStates{}

class WeatherGetCubitLoadingState extends WeatherGetCubitStates{}

class WeatherGetCubitSuccessState extends WeatherGetCubitStates{
  final String regionName;
  final String countryName;
  final CurrentWeather currentWeatherData;
  final List<Forecast> forecasetDays;
  WeatherGetCubitSuccessState({
    required this.regionName,
    required this.countryName,
    required this.currentWeatherData,
    required this.forecasetDays,
  });
}

class WeatherGetCubitFailedState extends WeatherGetCubitStates{
  final String message;
  WeatherGetCubitFailedState({required this.message});
}