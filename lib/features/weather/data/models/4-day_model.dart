import 'package:weather_app/core/network/dio_helper/api_constants.dart';

import '../../domain/entity/4-day.dart';

class DayModel extends Day{
   DayModel({
    required super.maxTemp, 
    required super.minTemp, 
    required super.avgTemp, 
    required super.description, 
    required super.icon,
    });

  factory DayModel.fromJson(Map<String,dynamic>json){
    return DayModel(
      maxTemp: json[SharedApiConstants.maxTempWord], 
      minTemp: json[SharedApiConstants.minTempWord], 
      avgTemp: json[SharedApiConstants.avgTempWord], 
      description: json[SharedApiConstants.conditionWord][SharedApiConstants.textWord], 
      icon: "https:${json[SharedApiConstants.conditionWord][SharedApiConstants.iconWord]}",
      );
  }

}