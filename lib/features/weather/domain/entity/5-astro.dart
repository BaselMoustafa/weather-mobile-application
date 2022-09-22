import 'package:equatable/equatable.dart';

class Astro extends Equatable{
  final String sunRise;
  final String sunSet;
  final String moonRise;
  final String moonSet;
  const Astro({
    required this.sunRise,
    required this.sunSet,
    required this.moonRise,
    required this.moonSet,
  });
  
 
  List<Object?> get props =>[
    sunRise,
    sunSet,
    moonRise,
    moonSet,
  ];

}