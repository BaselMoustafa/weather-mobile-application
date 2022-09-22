import 'package:equatable/equatable.dart';

class Day extends Equatable{
  dynamic maxTemp;
  dynamic minTemp;
  dynamic avgTemp;
  final String description;
  final String icon;
   Day({
    required this.maxTemp,
    required this.minTemp,
    required this.avgTemp,
    required this.description,
    required this.icon,
  });
  
  
  List<Object?> get props => [
    maxTemp,
    minTemp,
    avgTemp,
    description,
    icon,
  ];
}