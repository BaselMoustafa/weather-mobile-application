import 'package:weather_app/core/network/dio_helper/api_constants.dart';
import 'package:weather_app/features/weather/domain/entity/6-hour_model.dart';

class HourModel extends Hour{
  HourModel({
    required super.clock, 
    required super.temp, 
    required super.description, 
    required super.icon, 
    required super.windSpeed, 
    required super.windDirection, 
    required super.humadity,
    });

  factory HourModel.fromJson(Map<String,dynamic>json){
    String myClock= exctractClockFromDate(json[SharedApiConstants.timeWord]);
    return HourModel(
      clock:  myClock,
      temp: json[SharedApiConstants.tempWord] ,
      description:json[SharedApiConstants.conditionWord][SharedApiConstants.textWord] ,
      icon: "https:${json[SharedApiConstants.conditionWord][SharedApiConstants.iconWord]}",
      windSpeed:json[SharedApiConstants.windKphWord] ,
      windDirection:json[SharedApiConstants.windDir] ,
      humadity:json[SharedApiConstants.humidityWord],

    );
  }
  static String exctractClockFromDate(String date){
    String x="";
    for(int i = 0 ; i < 5 ; i++){
      x+=date[i+11];
    }
    return x;  
  }
  

}