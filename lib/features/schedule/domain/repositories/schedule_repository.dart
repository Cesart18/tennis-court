

import 'package:tennis_court/features/court/domain/domain.dart';
import 'package:tennis_court/features/schedule/domain/domain.dart';


abstract class ScheduleRepository {

    Future<void> createSchedule({ required Schedule schedule, required Court court});

    Future<void> deleteSchedule( Schedule schedule );

    Future<List<Schedule>> loadSchedules();

    Future<Schedule> getScheduleByCourt( int courtId );


  }