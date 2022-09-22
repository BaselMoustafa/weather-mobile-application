import 'package:weather_app/core/network/dio_helper/api_constants.dart';
import 'package:weather_app/features/weather/domain/entity/5-astro.dart';

class AstroModel extends Astro{
  const AstroModel({
    required super.sunRise, 
    required super.sunSet, 
    required super.moonRise, 
    required super.moonSet,
    });

  factory AstroModel.fromJson(Map<String,dynamic>json){
    return AstroModel(
      sunRise: json[SharedApiConstants.sunriseWord], 
      sunSet: json[SharedApiConstants.sunsetWord], 
      moonRise: json[SharedApiConstants.moonrisWord], 
      moonSet: json[SharedApiConstants.moonsetWord],
      );
  }

}