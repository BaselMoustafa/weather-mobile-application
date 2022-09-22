import 'package:flutter/material.dart';
import 'package:weather_app/core/responsive_widget/models/device_info.dart';
import '../functions/get_device_type.dart';
class ResponsiveWidget extends StatelessWidget {
  Widget Function(BuildContext context , DeviceInfo deviceInfo) builder; 
  ResponsiveWidget(this.builder);
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return LayoutBuilder(
      builder: ((context, constraints) {
        DeviceInfo deviceInfo=DeviceInfo(
          deviceType: getDeviceType(mediaQueryData),
          orientation: mediaQueryData.orientation,
          screenHeight: mediaQueryData.size.height,
          screenWidth: mediaQueryData.size.width,
          localHeight: constraints.maxHeight,
          localWidth: constraints.maxWidth,
        );
        return builder(context , deviceInfo);
      }),
    );    
  }
}
