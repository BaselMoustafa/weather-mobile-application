import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/core/style/color_manager.dart';

abstract class ThemeManager{
  static ThemeData getAppTheme(){
    return ThemeData(
      scaffoldBackgroundColor: ColorManager.primaryColor,
      appBarTheme:_getAppBarTheme(),
      textTheme: getTextTheme(),
      fontFamily: GoogleFonts.robotoSlab().fontFamily,
      iconTheme: IconThemeData(
        color: ColorManager.white,
        size: 60,
      )
    );
  }

  static TextTheme getTextTheme() => TextTheme(
    
    //FOR BIG WHIT LABELS
    displayLarge:TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.w500,
      color: ColorManager.white,
    ),
    //FOR SMALL LABELS
    bodyLarge:TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w300,
      color: ColorManager.colorOfTabs,
    ),

    //FOR MAIN TEMP
    headlineLarge:TextStyle(
      fontSize: 70,
      fontWeight: FontWeight.w500,
      color: ColorManager.white,
    ), 
    //FOR VALUES AS 26C AND 60% AND 10KMH
    headlineMedium:TextStyle(
      fontSize:20,
      color: ColorManager.white,
      fontWeight: FontWeight.w500,
      ), 
    //FONT AT CARDS OF MORNING
    titleMedium:TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.w500,
      color: ColorManager.colorOfDarkText,
    ), 
    
    //FOR THE TITLE AT FILTER WIDGET
    bodySmall:TextStyle(
      color: ColorManager.white,
      fontSize: 17,
      fontWeight: FontWeight.w500,
    ),
  );

  static AppBarTheme _getAppBarTheme() =>  AppBarTheme(
    elevation: 0,
    backgroundColor: ColorManager.transperent,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: ColorManager.transperent,
      statusBarIconBrightness: Brightness.light,
    ),
    centerTitle: true,
    iconTheme: IconThemeData(size: 30),
    actionsIconTheme: IconThemeData(
      color: ColorManager.white,
      size: 30,
    ),
    titleTextStyle: TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.w500,
      color: ColorManager.white,
    ),
  );
}