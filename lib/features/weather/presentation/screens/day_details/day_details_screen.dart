import 'package:flutter/material.dart';
import 'package:weather_app/core/responsive_widget/models/device_info.dart';
import 'package:weather_app/core/responsive_widget/widget/responsive_widget.dart';
import 'package:weather_app/core/style/color_manager.dart';
import 'package:weather_app/features/weather/domain/entity/3-forcast.dart';
import 'package:weather_app/features/weather/presentation/widgets/list_of_hours.dart';

class DayDetailsScreen extends StatelessWidget {
  Forecast forecastDay;
  DayDetailsScreen({required this.forecastDay});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(forecastDay.date),
      ),
      body: ResponsiveWidget(
        (context, bodyInfo){
          return SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(
                    height: bodyInfo.localHeight*0.2,
                    width: bodyInfo.localWidth,
                    child: Center(
                      child: Image.network(
                        forecastDay.dayData.icon,
                        fit: BoxFit.cover,
                        height: double.infinity,
                      )
                    ),
                  ),
                SizedBox(
                    height: bodyInfo.localHeight*0.1,
                    width: bodyInfo.localWidth,
                    child: Center(
                      child: Text(
                        forecastDay.dayData.description,
                        style: Theme.of(context).textTheme.displayLarge
                      ),
                    ),
                  ),
                SizedBox(
                  height: bodyInfo.localHeight*0.08,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "  Day",
                      style:  Theme.of(context).textTheme.bodyLarge,
                    ),
                  )
                ),
                ListOfHours(bodyInfo: bodyInfo, houresTodisplayed: forecastDay.hours),
                SizedBox(
                  height: bodyInfo.localHeight*0.3,
                  width: double.infinity,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    margin: EdgeInsets.only(
                      left: 20,
                      right: 20,
                      top: 20,
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: ColorManager.darkTransperent,
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: bodyInfo.localHeight*0.1,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Tempreture",
                              style: Theme.of(context).textTheme.displayLarge,
                            ),
                          ),
                        ),
                        _getOneLineOfData("Avg Temp","${forecastDay.dayData.avgTemp}c",bodyInfo, context),
                        _getOneLineOfData("Max Temp","${forecastDay.dayData.maxTemp}c",bodyInfo, context),
                        _getOneLineOfData("Min Temp","${forecastDay.dayData.minTemp}c",bodyInfo, context),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: bodyInfo.localHeight*0.35,
                  width: double.infinity,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    margin: EdgeInsets.only(
                      left: 20,
                      right: 20,
                      top: 20,
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: ColorManager.darkTransperent,
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: bodyInfo.localHeight*0.1,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Astro",
                              style: Theme.of(context).textTheme.displayLarge,
                            ),
                          ),
                        ),
                        _getOneLineOfData("Sunrise",forecastDay.astroData.sunRise,bodyInfo, context),
                        _getOneLineOfData("Sunset",forecastDay.astroData.sunSet,bodyInfo, context),
                        _getOneLineOfData("Moonrise",forecastDay.astroData.moonRise,bodyInfo, context),
                        _getOneLineOfData("Moonset",forecastDay.astroData.moonSet,bodyInfo, context),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  SizedBox _getOneLineOfData( String title , dynamic value,DeviceInfo bodyInfo, BuildContext context) {
    return SizedBox(
      height: bodyInfo.localHeight*0.05,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          value==null? title:"$title : $value",
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ),
    );
  }
  
}