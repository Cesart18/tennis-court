

  import 'package:tennis_court/features/schedule/domain/domain.dart';

List<Schedule> sortSchedulesByDate( List<Schedule> schedules ){

  List<Schedule> sortedSchedules = [...schedules];
  sortedSchedules.sort((a, b) => a.date.compareTo(b.date),);

  return sortedSchedules;

  }