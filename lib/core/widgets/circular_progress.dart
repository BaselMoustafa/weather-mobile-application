import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/core/style/color_manager.dart';

Widget getCircularProgressIndicator(){
  return Center(
    child: CircularProgressIndicator(
      color: ColorManager.colorOfTabs,
    ),
  );
}