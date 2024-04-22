import '../domain.dart';

class ForecastHour {
  final DateTime hour;
  final int willItRain;
  final int chanceOfRain;
  final WheaterCondition condition;

  ForecastHour(
      {required this.hour,
      required this.willItRain,
      required this.chanceOfRain,
      required this.condition});
}