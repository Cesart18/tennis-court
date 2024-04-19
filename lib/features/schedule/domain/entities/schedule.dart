import 'package:isar/isar.dart';
import 'package:tennis_court/features/court/domain/domain.dart';

part 'schedule.g.dart';

@collection
class Schedule {
  Id? id;

  @Index()
  final DateTime date;
  @Index(unique: true)
  final DateTime time;

  final courts = IsarLinks<Court>();



  Schedule(
      {required this.date,
      required this.time,
      });
}
