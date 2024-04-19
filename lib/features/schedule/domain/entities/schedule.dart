import 'package:isar/isar.dart';

part 'schedule.g.dart';

@collection
class Schedule {
  Id? id;

  @Index()
  final DateTime date;
  @Index(unique: true)
  final DateTime time;
  final int courtId;



  Schedule(
      {required this.date,
      required this.time,
      required this.courtId,
      });
}
