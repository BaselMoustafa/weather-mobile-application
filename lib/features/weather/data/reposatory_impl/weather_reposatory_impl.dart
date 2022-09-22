import 'package:weather_app/core/error/exceptions.dart';
import 'package:weather_app/core/error/failures.dart';
import 'package:weather_app/core/network/network_info/network_connection_info.dart';
import 'package:weather_app/features/weather/data/data_source/remote_data_source.dart';
import 'package:weather_app/features/weather/domain/entity/1-weather_data.dart';
import 'package:weather_app/core/error/failuer_messages.dart';
import 'package:dartz/dartz.dart';
import 'package:weather_app/features/weather/domain/reposatory/wather_reposatory.dart';

class WeatherReposatoryImpl extends  WeatherReposatory{
  final RemoteDataSource remoteDataSource;
  final NetworkConnectionInfo networkConnectionInfo;
  WeatherReposatoryImpl({required this.networkConnectionInfo,required this.remoteDataSource});

  Future<Either<Failure, WeatherData>> getWeatherDataByKeyWord(Map<String, dynamic> queries) async{
    if(await networkConnectionInfo.isConnected){
      try{
        return Right(await remoteDataSource.getWeatherData(queries));
      }on ServerException catch (errorResponse){
        return Left(
          ServerFailure(message: errorResponse.errorApiModel.message),
        );
      }
    }else{
      return const Left(
         OfflineFailure(message:  FailureMessages.offlineFailure),
      );
    }
  }

}