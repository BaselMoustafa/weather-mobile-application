import 'package:weather_app/core/network/dio_helper/api_constants.dart';

class QueryModel {
  final String q;
  final int days;
  final String apiKey; 
  QueryModel._original({
    required this.q,
    required this.days,
    required this.apiKey,
  });

  static Map<String,dynamic> convertDataToMapOfQueries ({required String q }){
    QueryModel model= QueryModel._original(
      q: q,
      days: 14,
      apiKey: BaseApiConstants.apiKey,
    );
    return {
      "q":model.q,
      "key":model.apiKey,
      "days":model.days,
    };
  }

}