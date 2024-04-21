import 'package:isar/isar.dart';
import 'package:tennis_court/features/court/domain/domain.dart';

part 'schedule.g.dart';

@collection
class Schedule {
  Id? id;

  @Index()
  final DateTime date;

  final courts = IsarLinks<Court>();

  final String userName;



  Schedule({
      required this.date,
      required this.userName
      });
}
