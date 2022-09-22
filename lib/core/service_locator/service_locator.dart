
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:weather_app/core/network/dio_helper/dio_helper.dart';
import 'package:weather_app/core/network/network_info/network_connection_info.dart';
import 'package:weather_app/features/weather/data/data_source/remote_data_source.dart';
import 'package:weather_app/features/weather/data/reposatory_impl/weather_reposatory_impl.dart';
import 'package:weather_app/features/weather/domain/reposatory/wather_reposatory.dart';
import 'package:weather_app/features/weather/domain/use_cases/get_weather_by_city_use_case.dart';
import 'package:weather_app/features/weather/presentation/controller/weather_get_cubit.dart/weater_get_cubit.dart';

final getIt = GetIt.instance;
class ServiceLocator {
  
  void init(){

    //CUBITS
    getIt.registerFactory(() => GetWeatherCubit(getWeatherByKeyWordUseCase: getIt()));
    
    
    //USECASES
    getIt.registerLazySingleton(() => GetWeatherByKeyWordUseCase(weatherReposatory: getIt()));
    
    
    //REPOSITORY
    getIt.registerLazySingleton<WeatherReposatory>(() => WeatherReposatoryImpl( 
      remoteDataSource: getIt(),
      networkConnectionInfo: getIt(),
     ) );
    

    //DATA SOURCE
    getIt.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl(dioHelper:getIt()));

    //HELPERS
    getIt.registerLazySingleton<DioHelper>(() => DioHelperImpl());

    //NETWORK INFO
    getIt.registerLazySingleton<NetworkConnectionInfo>(() => NetworkConnectionInfoImple(internetConnectionChecker: getIt()));

    //CONNECTION CHECKER
    getIt.registerLazySingleton(() => InternetConnectionChecker());
  }

}

