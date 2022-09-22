import 'package:dartz/dartz.dart';
import 'package:weather_app/core/error/failuer_messages.dart';
import 'package:weather_app/features/weather/domain/entity/1-weather_data.dart';

abstract class WeatherReposatory {
  Future<Either<Failure,WeatherData>> getWeatherDataByKeyWord(Map<String , dynamic>queries);
}