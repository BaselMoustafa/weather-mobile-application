import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/core/error/failuer_messages.dart';
import 'package:weather_app/features/weather/domain/entity/1-weather_data.dart';
import 'package:weather_app/features/weather/domain/reposatory/wather_reposatory.dart';
import 'package:weather_app/features/weather/domain/use_cases/query_model.dart';

class GetWeatherByKeyWordUseCase extends Equatable{

  WeatherReposatory weatherReposatory;

  GetWeatherByKeyWordUseCase({required this.weatherReposatory});

  Future<Either<Failure,WeatherData>> excute(String q){
    return weatherReposatory.getWeatherDataByKeyWord(QueryModel.convertDataToMapOfQueries(q: q));
  }
 
  List<Object?> get props => [weatherReposatory];

}