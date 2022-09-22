import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/responsive_widget/models/device_info.dart';
import 'package:weather_app/core/responsive_widget/widget/responsive_widget.dart';
import 'package:weather_app/core/widgets/circular_progress.dart';
import 'package:weather_app/core/widgets/failure_widget.dart';
import 'package:weather_app/features/weather/presentation/controller/weather_get_cubit.dart/weater_get_cubit.dart';
import 'package:weather_app/features/weather/presentation/controller/weather_get_cubit.dart/weather_get_states.dart';
import 'package:weather_app/features/weather/presentation/screens/home/list_of_forecast.dart';
import 'package:weather_app/features/weather/presentation/screens/search/search_screen.dart';
import 'package:weather_app/features/weather/presentation/widgets/list_of_hours.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder< GetWeatherCubit,WeatherGetCubitStates>(builder: (context,state){
          if(state is WeatherGetCubitSuccessState){
            return Text(state.regionName);
          }else{return SizedBox();}
        } ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: ()async{
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) => SearchScreen())
                ),
              );
            },
          ),
        ],
      ),
      body: ResponsiveWidget(
        ((context, bodyInfo) {
          return BlocBuilder< GetWeatherCubit,WeatherGetCubitStates>(
            builder: ((context, state) {
              if(state is WeatherGetCubitSuccessState){ 
                return _getSuccessScreen(state, context);
              }else if(state is WeatherGetCubitFailedState) {
                return getOfflineFailureWidget(
                  context: context, 
                  message:state.message, 
                  bodyInfo: bodyInfo,
                  );
              }else {
                return getCircularProgressIndicator();
              }
            }),
          );
        })
      ),
    );
  }

  Widget _getSuccessScreen( WeatherGetCubitSuccessState state, BuildContext context){
    return Padding(
        padding: const EdgeInsets.only(left: 10),
        child: ResponsiveWidget(
          ((context, bodyInfo) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: bodyInfo.localHeight*0.05,
                  child: Text(
                    "Last update at : ${state.currentWeatherData.lastUpdate}",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
                SizedBox(
                  height: bodyInfo.localHeight*0.1,
                  child: Center(
                    child: Text(
                      state.currentWeatherData.description,
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                  ),
                ),
                SizedBox(
                  height: bodyInfo.localHeight*0.12,
                  child: Center(
                    child: Image.network(
                      state.currentWeatherData.icon,
                      height: double.infinity,
                      width: bodyInfo.localWidth/3,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: bodyInfo.localHeight*0.15,
                  child: Center(
                    child: Text(
                      "${state.currentWeatherData.temp} c",
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  ),
                ),
                SizedBox(
                  height: bodyInfo.localHeight*0.1,
                  child: Center(
                    child: Row(
                      children: [
                        _getTempAndHumadityAndWind(context, bodyInfo , "Temp","${state.currentWeatherData.temp} c"),
                        _getTempAndHumadityAndWind(context, bodyInfo , "Humadity","${state.currentWeatherData.humidity}%"),
                        _getTempAndHumadityAndWind(context, bodyInfo , "Wind","${state.currentWeatherData.windSpeed} Km/h"),
                      ],
                    ),
                  ),
                ),
                _getTitle(bodyInfo,context,"Day"),
                ListOfHours(bodyInfo: bodyInfo, houresTodisplayed: state.forecasetDays[0].hours,),
                _getTitle( bodyInfo,context,"Forecast"),
                ForecastListWidget(bodyInfo: bodyInfo, state: state),
                SizedBox(height: bodyInfo.localHeight*0.02,),
              ],
            );
          })
        ),
      );
    
  }

  SizedBox _getTitle( DeviceInfo bodyInfo,BuildContext context , String title) {
    return SizedBox(
      height: bodyInfo.localHeight*0.08,
      child: Center(
        child: Row(
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }

  Expanded _getTempAndHumadityAndWind(BuildContext context, DeviceInfo bodyInfo , String label ,String value ) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            value,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
  
}