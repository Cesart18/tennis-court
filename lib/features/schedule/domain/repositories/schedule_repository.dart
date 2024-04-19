

import 'package:tennis_court/features/schedule/domain/domain.dart';


abstract class ScheduleRepository {

    Future<void> createSchedule( DateTime date, DateTime time );

    Future<void> deleteSchedule( Schedule schedule );

    Future<List<Schedule>> loadSchedules();

    Future<Schedule> getScheduleByCourt( int courtId );


  }