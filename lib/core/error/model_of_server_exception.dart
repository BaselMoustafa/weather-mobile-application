import 'package:weather_app/core/network/dio_helper/api_constants.dart';

class ErrorApiModel{
  final int code;
  final String message;
  const ErrorApiModel({required this.code,required this.message});

  factory ErrorApiModel.fromJson(Map<String , dynamic>json){
    return ErrorApiModel(
      code: json[SharedApiConstants.errorWord][SharedApiConstants.codeWord],
      message: json[SharedApiConstants.errorWord][SharedApiConstants.messageWord],
    );
  }
}