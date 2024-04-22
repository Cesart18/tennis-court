

import 'package:tennis_court/features/api/domain/domain.dart';
import 'package:tennis_court/features/court/domain/domain.dart';
import 'package:tennis_court/features/schedule/domain/domain.dart';


abstract class ScheduleDatasource {

    Future<void> createSchedule( Schedule schedule,  Court court, [ ForecastDay? wheater ] );

    Future<void> deleteSchedule( Schedule schedule );

    Future<List<Schedule>> loadSchedules();


  }