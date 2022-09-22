
import 'package:flutter/material.dart';
import 'package:weather_app/core/network/shared_preferencies/cache_helper.dart';
import 'package:weather_app/core/network/shared_preferencies/cahceConstants.dart';
import 'package:weather_app/core/responsive_widget/widget/responsive_widget.dart';
import 'package:weather_app/core/style/color_manager.dart';
import 'package:weather_app/features/weather/presentation/controller/weather_get_cubit.dart/weater_get_cubit.dart';
import 'package:weather_app/features/weather/presentation/screens/home/home_screen.dart';

class SearchScreen extends StatelessWidget {
  GlobalKey<FormState> formKey=GlobalKey<FormState>();
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ResponsiveWidget(
        ((context, bodyInfo) {
          return Form(
            key: formKey,
            child: Column(
                children: [
                  SizedBox(height: bodyInfo.localHeight*0.03,),
                  SizedBox(
                    height: bodyInfo.localHeight*0.2,
                    child:Align(
                      alignment: Alignment.topCenter,
                      child: _getTextFormField(context)),
                  ),
                  SizedBox(
                    height: bodyInfo.localHeight*0.1,
                  ),
                  SingleChildScrollView(
                    child: SizedBox(
                      height: bodyInfo.localHeight*0.3,
                      child: Image.asset(
                        "assets/search.png",
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
          );
        })
      ),
    );
  }
  Widget _getTextFormField(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Align(
        alignment: Alignment.topCenter,
        child: TextFormField(
          controller: searchController,
          cursorColor: ColorManager.white,
          style: TextStyle(
            color: ColorManager.white
          ),
          decoration: InputDecoration(
            border: _getDecorationOfBorder(false),
            enabledBorder:_getDecorationOfBorder(false),
            focusedBorder: _getDecorationOfBorder(false),
            errorBorder: _getDecorationOfBorder(true) ,
            labelText: "Search",
            hintText: "Enter regoin...",
            hintStyle: TextStyle(color: ColorManager.white),
            labelStyle: TextStyle(
              color: ColorManager.white
            ),
          ),
          validator: (value){
            if(value ==null || value.trim().length==0){
              return "This field is required";
            }
          },
          onFieldSubmitted: (value)async{
            if(formKey.currentState!.validate()){
              await showDialog(
                context: context, 
                builder: (context){
                  return AlertDialog(
                    alignment: Alignment.centerLeft,
                    title: Text(
                      "Save this region as a defult region?",
                      style: TextStyle(color: ColorManager.colorOfDarkText),
                      ),
                    actions:  _getActions(context),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    backgroundColor: ColorManager.colorOfTabs,
                  );
                },
                );
              Navigator.pop(context);
              await GetWeatherCubit.get(context).getWeatherData(searchController.text);
            }
          },
        ),
      ),
    );
  }

  List<Widget> _getActions(BuildContext context)  {
    return [
      MaterialButton(
        onPressed: ()async{
          _goToHomePage(context);
          await GetWeatherCubit.get(context).getWeatherData(searchController.text);
          await CacheHelper.setDataAtSharedPrefrence(Key: CacheConstants.defultRegionWord, value: searchController.text);
        },
        child: Text(
          "Ok",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: ColorManager.colorOfDarkText,
            ),
          ),
      ),
      
      MaterialButton(
        onPressed: ()async{
          _goToHomePage(context);
          await GetWeatherCubit.get(context).getWeatherData(searchController.text);
        },
        child: Text(
          "Cancel",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: ColorManager.colorOfDarkText,
            ),
          ),
      ),

    ];
  }
  OutlineInputBorder _getDecorationOfBorder(bool error){
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(
        color: error ?  Colors.red : ColorManager.white,
      ) ,
    );
  }
  void _goToHomePage(context){
    Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder:(contextOfDes) =>HomeScreen(),
    ),
    (route){
      return false;
    },
  );
  }
}