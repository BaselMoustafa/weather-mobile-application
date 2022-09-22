import 'package:flutter/material.dart';
import 'package:weather_app/core/responsive_widget/models/device_info.dart';
import 'package:weather_app/core/style/color_manager.dart';
import 'package:weather_app/features/weather/presentation/controller/weather_get_cubit.dart/weather_get_states.dart';
import 'package:weather_app/features/weather/presentation/screens/day_details/day_details_screen.dart';
class ForecastListWidget extends StatelessWidget {
  DeviceInfo bodyInfo;
  WeatherGetCubitSuccessState state;
  ForecastListWidget({required this.bodyInfo , required this.state });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: bodyInfo.localHeight*0.15,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 13,
        itemBuilder:(context , index)=>_getItemOfForecast(
          state,
          bodyInfo: bodyInfo,
          context:context,
          index:index,
        ) ,
      ),
    );
  }
  Widget _getItemOfForecast( WeatherGetCubitSuccessState state,{
    required DeviceInfo bodyInfo,
    required BuildContext context , 
    required int index , 
    }){
    return InkWell(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return DayDetailsScreen(forecastDay: state.forecasetDays[index+1]);
            },
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        margin: EdgeInsets.only(right: 20),
        width: bodyInfo.localWidth*(5/10),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: ColorManager.colorOfTabs,
        ),
        child: Row(
          children: [
            Image.network(
             state.forecasetDays[index+1].dayData.icon,
            ),
            Spacer(),
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${state.forecasetDays[index+1].date}",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    "${state.forecasetDays[index+1].dayData.avgTemp}c",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            Spacer(),
          
          ],
        ),
      ),
    );
  }
}