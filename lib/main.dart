import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/network/dio_helper/dio_helper.dart';
import 'package:weather_app/core/network/shared_preferencies/cache_helper.dart';
import 'package:weather_app/core/network/shared_preferencies/cahceConstants.dart';
import 'package:weather_app/core/service_locator/service_locator.dart';
import 'package:weather_app/core/style/app_theme.dart';
import 'package:weather_app/features/weather/presentation/controller/weather_get_cubit.dart/weater_get_cubit.dart';
import 'package:weather_app/features/weather/presentation/screens/home/home_screen.dart';
import 'package:weather_app/features/weather/presentation/screens/search/search_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  ServiceLocator().init();
  await DioHelperImpl.init();
  await CacheHelper.init();
  runApp(MyApp());
  runApp(
    DevicePreview(builder: ((context) =>  MyApp()),)
  );
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    if(CacheHelper.getDataFromSharedPrefrences(key: CacheConstants.defultRegionWord)==null){
      return MultiBlocProvider(
        providers: [
          BlocProvider(create: ((context) =>getIt<GetWeatherCubit>())),
        ],
        child: MaterialApp(
          builder: DevicePreview.appBuilder,
          debugShowCheckedModeBanner: false,
          theme: ThemeManager.getAppTheme(),
          home:SearchScreen() ,
        ),
      );
    }else{
      return MultiBlocProvider(
        providers: [
          BlocProvider(create: ((context) =>getIt<GetWeatherCubit>()..getWeatherData(CacheHelper.getDataFromSharedPrefrences(key: CacheConstants.defultRegionWord) as String))),
        ],
        child: MaterialApp(
          builder: DevicePreview.appBuilder,
          debugShowCheckedModeBanner: false,
          theme: ThemeManager.getAppTheme(),
          home:HomeScreen() ,
        ),
      );
    }
    
  }

  
  
}
