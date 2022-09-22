import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/adummy_data/dummy.dart';
import 'package:weather_app/core/error/exceptions.dart';
import 'package:weather_app/core/error/model_of_server_exception.dart';
import 'package:weather_app/core/network/dio_helper/api_constants.dart';
import 'package:weather_app/core/network/dio_helper/dio_helper.dart';
import 'package:weather_app/features/weather/data/models/1-weather_data_model.dart';

abstract class RemoteDataSource extends Equatable{
  Future<WeatherDataModel>getWeatherData(Map<String,dynamic> queries);
  List<Object?> get props => [];
}

class RemoteDataSourceImpl extends RemoteDataSource{
  final DioHelper dioHelper;
  RemoteDataSourceImpl({required this.dioHelper});
  Future<WeatherDataModel>getWeatherData(Map<String,dynamic> queries)async{
    // return WeatherDataModel.fromJson(dummyApiResponse);
    Response responseOrError = await dioHelper.getData(endPoint:BaseApiConstants.endPoint , queries: queries);
    if(responseOrError.statusCode==200){
      return WeatherDataModel.fromJson(responseOrError.data);
    }else{
      throw ServerException(
        errorApiModel: ErrorApiModel.fromJson(responseOrError.data),
      );
    }
  }
} 