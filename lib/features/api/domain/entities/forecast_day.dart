import '../domain.dart';

class ForecastDay {
  final int dailyWillItRain;
  final int dailyChanceOfRain;
  final WheaterCondition condition;

  ForecastDay(
      {required this.dailyWillItRain,
      required this.dailyChanceOfRain,
      required this.condition});
}