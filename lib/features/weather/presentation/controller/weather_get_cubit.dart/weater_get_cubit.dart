import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/error/failuer_messages.dart';
import 'package:weather_app/features/weather/domain/entity/1-weather_data.dart';
import 'package:weather_app/features/weather/domain/use_cases/get_weather_by_city_use_case.dart';
import 'package:weather_app/features/weather/presentation/controller/weather_get_cubit.dart/weather_get_states.dart';

class GetWeatherCubit extends Cubit<WeatherGetCubitStates>{
  final GetWeatherByKeyWordUseCase getWeatherByKeyWordUseCase;
  GetWeatherCubit({
    required this.getWeatherByKeyWordUseCase,
  }):super(WeatherGetCubitInitialState());
  static GetWeatherCubit get(context)=> BlocProvider.of(context);
  Future<void> getWeatherData(String q)async{
    emit(WeatherGetCubitLoadingState());
    Either<Failure,WeatherData>responseOrFailure=await getWeatherByKeyWordUseCase.excute(q);
    responseOrFailure.fold(
      (failure){
        emit(WeatherGetCubitFailedState(message: failure.message));
      },
      (weatherData){
        emit(
          WeatherGetCubitSuccessState(
            regionName: weatherData.regionName, 
            countryName: weatherData.countryName, 
            currentWeatherData: weatherData.currentWeather, 
            forecasetDays: weatherData.forecasetDays,
            )
        );
      },
    );
  }

}