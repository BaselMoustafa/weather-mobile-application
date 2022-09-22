import 'package:weather_app/core/network/dio_helper/api_constants.dart';
import 'package:weather_app/features/weather/data/models/2-current_weather_model.dart';
import 'package:weather_app/features/weather/data/models/3-forecast_model.dart';
import 'package:weather_app/features/weather/domain/entity/1-weather_data.dart';
import 'package:weather_app/features/weather/domain/entity/3-forcast.dart';

class WeatherDataModel extends WeatherData{
  const WeatherDataModel({
    required super.regionName, 
    required super.countryName, 
    required super.currentWeather, 
    required super.forecasetDays,
    });

  factory WeatherDataModel.fromJson(Map<String,dynamic>json){
    List<Forecast> myForeCaseDays=[];
    json[SharedApiConstants.forecastWord][SharedApiConstants.forecastdayWord].forEach((element){
      myForeCaseDays.add(ForecastModel.fromJson(element as Map<String,dynamic>));
    });
    
    return WeatherDataModel(
      regionName: json[SharedApiConstants.locationWord][SharedApiConstants.nameWord], 
      countryName: json[SharedApiConstants.locationWord][SharedApiConstants.countryWord],  
      currentWeather: CurrentWeatherModel.fromJson(json[SharedApiConstants.currentWord]), 
      forecasetDays: myForeCaseDays,
      );
  }



}