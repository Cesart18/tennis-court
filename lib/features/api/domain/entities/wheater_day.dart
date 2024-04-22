import '../domain.dart';

class WheaterDay {
  final int dailyWillItRain;
  final int dailyChanceOfRain;
  final WheaterCondition condition;

  WheaterDay(
      {required this.dailyWillItRain,
      required this.dailyChanceOfRain,
      required this.condition});
}