import 'package:flutter/material.dart';
import 'package:weather_app/core/responsive_widget/models/device_info.dart';
import 'package:weather_app/core/responsive_widget/widget/responsive_widget.dart';
import 'package:weather_app/core/style/color_manager.dart';
import 'package:weather_app/features/weather/domain/entity/6-hour_model.dart';

class HourDetailsScreen extends StatelessWidget {
  Hour hour;
  HourDetailsScreen({required this.hour});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(hour.clock),
      ),
      body: ResponsiveWidget(
        (context , bodyInfo){
          print(bodyInfo.localWidth);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                  height: bodyInfo.localHeight*0.15,
                  child: Center(
                    child: Text(
                      hour.description,
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                  ),
                ),
                SizedBox(
                  height: bodyInfo.localHeight*0.15,
                  child: Center(
                    child: Image.network(
                      hour.icon , 
                      height: double.infinity,
                      width: bodyInfo.localWidth/4 ,
                      fit: BoxFit.cover,
                      ),
                  ),
                ),
                _getSpace(bodyInfo),
                SizedBox(
                  height: bodyInfo.localHeight*0.25,
                  child: Center(
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              _getCard(bodyInfo,"Temp","${hour.temp}c"),
                              _getSpace(bodyInfo),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              _getSpace(bodyInfo),
                              _getCard(bodyInfo,"Humadity","${hour.humadity}%"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: bodyInfo.localHeight*0.25,
                  child: Center(
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              _getCard(bodyInfo,"Wind speed","${hour.windSpeed} Km/h"),
                              _getSpace(bodyInfo),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              _getSpace(bodyInfo),
                              _getCard(bodyInfo,"Wind Direction","${hour.windDirection}"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }

  Widget _getSpace(DeviceInfo bodyInfo ){
    return SizedBox(
      height: bodyInfo.localHeight*0.05,
    );
  }
  Widget _getCard(DeviceInfo bodyInfo, String label , dynamic value){
    return SizedBox(
      height: bodyInfo.localHeight*0.2,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        height: double.infinity,
        width: double.infinity,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          color: ColorManager.colorOfTabs,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 18,
                color: ColorManager.colorOfDarkText,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(height: bodyInfo.localHeight*0.01,),
            Text(
              value,
              style: TextStyle(
                fontSize: 22,
                color: ColorManager.colorOfDarkText,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}