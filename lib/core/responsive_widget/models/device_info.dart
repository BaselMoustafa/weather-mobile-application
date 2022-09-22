import 'package:flutter/material.dart';
import 'package:weather_app/core/responsive_widget/enums/device_type.dart';

class DeviceInfo{
  final Orientation orientation;
  final CurrentDevice deviceType;
  final double screenHeight; 
  final double screenWidth; 
  final double localHeight; 
  final double localWidth; 
   
  DeviceInfo({
    required this.orientation,
    required this.deviceType,
    required this.screenHeight, 
    required this.screenWidth, 
    required this.localHeight, 
    required this.localWidth,
  });

}