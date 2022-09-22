import 'package:flutter/material.dart';
import 'package:weather_app/core/network/shared_preferencies/cache_helper.dart';
import 'package:weather_app/core/network/shared_preferencies/cahceConstants.dart';
import 'package:weather_app/core/responsive_widget/models/device_info.dart';
import 'package:weather_app/core/style/color_manager.dart';
import 'package:weather_app/features/weather/presentation/controller/weather_get_cubit.dart/weater_get_cubit.dart';

Widget getOfflineFailureWidget({
  required BuildContext context,
  required String message , 
  required DeviceInfo bodyInfo, 
  }){
    return  RefreshIndicator(
      color: ColorManager.primaryColor,
      backgroundColor: ColorManager.colorOfTabs,
      onRefresh: ()async{
        await GetWeatherCubit.get(context).getWeatherData(CacheHelper.getDataFromSharedPrefrences(key: CacheConstants.defultRegionWord));
      },
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: bodyInfo.localHeight*0.25,
            ),
            SizedBox(
              height: bodyInfo.localHeight*0.35,
              child: Center(
                child: Image.asset(
                  "assets/offline.png",
                  height:200,
                  width: 200,
                  fit: BoxFit.cover,
                  ),
              ),
            ),
            SizedBox(height: bodyInfo.localHeight*0.05,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: SizedBox(
                height: bodyInfo.localHeight*0.1,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    message,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      color: ColorManager.white,
                      
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: bodyInfo.localHeight*0.31,),
          ],
        
          ),
      ),
      
    );
}