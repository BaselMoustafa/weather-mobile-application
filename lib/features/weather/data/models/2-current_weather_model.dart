import 'package:weather_app/core/network/dio_helper/api_constants.dart';
import 'package:weather_app/features/weather/domain/entity/2-current_weather.dart';

class CurrentWeatherModel extends CurrentWeather{
  CurrentWeatherModel({
    required super.lastUpdate, 
    required super.temp, 
    required super.windSpeed, 
    required super.windDirection, 
    required super.humidity, 
    required super.description, 
    required super.icon,
    });

  factory CurrentWeatherModel.fromJson(Map<String,dynamic>json){
    return CurrentWeatherModel(
      lastUpdate: json[SharedApiConstants.lastUpdateWord], 
      temp: json[SharedApiConstants.tempWord], 
      windSpeed: json[SharedApiConstants.windKphWord], 
      windDirection: json[SharedApiConstants.windDir], 
      humidity: json[SharedApiConstants.humidityWord], 
      description: json[SharedApiConstants.conditionWord][SharedApiConstants.textWord], 
      icon: "https:${json[SharedApiConstants.conditionWord][SharedApiConstants.iconWord]}",
      );
  }

}