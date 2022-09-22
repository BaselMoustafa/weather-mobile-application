import 'package:flutter/material.dart';
import 'package:weather_app/core/responsive_widget/models/device_info.dart';
import 'package:weather_app/core/style/color_manager.dart';
import 'package:weather_app/features/weather/domain/entity/6-hour_model.dart';
import 'package:weather_app/features/weather/presentation/screens/hour_datails_screen/hour_details_screen.dart';

class ListOfHours extends StatelessWidget {
  DeviceInfo bodyInfo;
  List<Hour>houresTodisplayed;
  ListOfHours({required this.bodyInfo ,  required this.houresTodisplayed,});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: bodyInfo.localHeight*0.15,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 8,
        itemBuilder:(context , index)=>_getItemOfHours(
          bodyInfo: bodyInfo,
          context:context,
          index:index,
        ) ,
      ),
    );
  }
  Widget _getItemOfHours({
    required DeviceInfo bodyInfo,
    required BuildContext context , 
     required int index,
    }){
    return InkWell(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder:(context) => HourDetailsScreen(hour:houresTodisplayed[3*index] ),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(right: 20),
        width: bodyInfo.localWidth*(4/10),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: ColorManager.colorOfTabs,
        ),
        child: Row(
          children: [
            Image.network(
              houresTodisplayed[3*index].icon,
            ),
            Spacer(),
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${houresTodisplayed[3*index].clock}",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    "${houresTodisplayed[3*index].temp}c",
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