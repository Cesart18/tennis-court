

import 'package:isar/isar.dart';
import 'package:tennis_court/features/court/domain/domain.dart';
import 'package:tennis_court/features/schedule/domain/domain.dart';
import 'package:tennis_court/features/schedule/infrastructure/infrastructure.dart';
import 'package:tennis_court/shared/shared.dart';

class ScheduleDatasourceImpl extends ScheduleDatasource{
  
  late Future<Isar> db;
  ScheduleDatasourceImpl(){
    db = IsarService().db;
  }

  @override
  Future<void> createSchedule( Schedule schedule,  Court court) async {
    final isar = await db;
    final newSchedule = schedule
    ..courts.add(court);
    
    final courtHasSchedule = await court.schedules.filter()
    .initialDateEqualTo(schedule.initialDate).findFirst();


    try {
      
      if( courtHasSchedule != null){
        throw CustomError(message: 'Horario para esta cancha no disponible');
      }
      for (final existingSchedule in court.schedules) {
        if (schedule.initialDate.isBefore(existingSchedule.endDate) && schedule.endDate.isAfter(existingSchedule.initialDate)) {
          throw CustomError(message: 'La nueva agenda se superpone con una agenda existente');
        }
        }
      await isar.writeTxn(() async{
      await isar.schedules.put(newSchedule);
      await schedule.courts.save();
    });
    } on IsarError catch (e) {
      if(e.message == 'Unique index violated.'){
        throw CustomError(message: 'Esta hora no esta disponible');
      }
      
    }
    
  }

  @override
  Future<void> deleteSchedule(Schedule schedule) async {
    final isar = await db;
    await isar.writeTxn(() async{
      isar.schedules.delete(schedule.id!);
    });
  }


  @override
  Future<List<Schedule>> loadSchedules() async {
    final isar = await db;
    final schedules = await isar.schedules.where().findAll();

    return Future.value(schedules);
  }

  
  
  
  

}