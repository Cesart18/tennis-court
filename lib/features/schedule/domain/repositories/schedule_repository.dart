

import 'package:tennis_court/features/schedule/domain/domain.dart';


abstract class ScheduleRepository {

    Future<void> createSchedule({ required DateTime date, required DateTime time, required String userName });

    Future<void> deleteSchedule( Schedule schedule );

    Future<List<Schedule>> loadSchedules();

    Future<Schedule> getScheduleByCourt( int courtId );


  }