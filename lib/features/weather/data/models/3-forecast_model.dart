import 'package:weather_app/core/network/dio_helper/api_constants.dart';
import 'package:weather_app/features/weather/data/models/4-day_model.dart';
import 'package:weather_app/features/weather/data/models/5_astro_model.dart';
import 'package:weather_app/features/weather/data/models/6-hour_model.dart';
import 'package:weather_app/features/weather/domain/entity/3-forcast.dart';
import 'package:weather_app/features/weather/domain/entity/6-hour_model.dart';

class ForecastModel extends Forecast{
  const ForecastModel({
    required super.date, 
    required super.dayData, 
    required super.astroData, 
    required super.hours,
    });
    
  factory ForecastModel.fromJson(Map<String,dynamic>json){


    List<Hour> hours=[];
    json[SharedApiConstants.hourWord].forEach((element){
      hours.add(HourModel.fromJson(element as Map<String , dynamic>));
    });

    return ForecastModel(
      date: json[SharedApiConstants.dateWord], 
      dayData: DayModel.fromJson(json[SharedApiConstants.dayWord]), 
      astroData: AstroModel.fromJson(json[SharedApiConstants.astroWord]), 
      hours: hours,
      );
  }


}