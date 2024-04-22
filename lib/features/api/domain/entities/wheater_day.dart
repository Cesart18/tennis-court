import '../domain.dart';

class WheaterDay {
  final int? dailyWillItRain;
  final int? dailyChanceOfRain;
  final WheaterCondition condition;

  WheaterDay(
      { this.dailyWillItRain,
       this.dailyChanceOfRain,
       required this.condition});
}