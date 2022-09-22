import 'package:equatable/equatable.dart';

class Hour extends Equatable{
  final String clock;
  dynamic temp;
  final String description;
  final String icon;
  dynamic windSpeed;
  final String windDirection;
  dynamic humadity;
  Hour({
    required this.clock,
    required this.temp,
    required this.description,
    required this.icon,
    required this.windSpeed,
    required this.windDirection,
    required this.humadity,
  });
  
 
  List<Object?> get props =>[
    clock,
    temp,
    description,
    icon,
    windSpeed,
    windDirection,
    humadity,
  ];

}