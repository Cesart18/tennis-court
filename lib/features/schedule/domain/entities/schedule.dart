import 'package:isar/isar.dart';
import 'package:tennis_court/features/court/domain/domain.dart';

part 'schedule.g.dart';

@collection
class Schedule {
  Id? id;


  final DateTime initialDate;
  final DateTime endDate;

  @Backlink(to: 'schedules')
  final court = IsarLink<Court>();

  final String userName;
  late int? willItRain;
  late int? chanceOfRain;
  late String? conditionText;
  late String? icon;


  Schedule({
      required this.initialDate,
      required this.userName,
      required this.endDate,
      });
}
