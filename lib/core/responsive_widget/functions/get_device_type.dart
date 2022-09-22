import 'package:flutter/material.dart';
import 'package:weather_app/core/responsive_widget/enums/device_type.dart';

CurrentDevice getDeviceType(MediaQueryData mediaQueryData){
    Orientation orientation = mediaQueryData.orientation;
    double width=0;

    if(orientation ==Orientation.landscape){
      width=mediaQueryData.size.height;
    }else{
      width =mediaQueryData.size.width;
    }
   
    if(width>=950){
      return CurrentDevice.DeskTop;
    }
    if(width>=600){
      return CurrentDevice.Tablet;
    }

    return CurrentDevice.Mobile;
    
  }