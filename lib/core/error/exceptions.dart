import 'package:weather_app/core/error/model_of_server_exception.dart';

class ServerException implements Exception{
  ErrorApiModel errorApiModel;
  ServerException({required this.errorApiModel});
}
class OfflineException implements Exception{}