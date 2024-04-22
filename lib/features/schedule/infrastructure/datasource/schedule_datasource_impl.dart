

import 'package:isar/isar.dart';
import 'package:tennis_court/features/api/domain/entities/wheater_day.dart';
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
  Future<void> createSchedule(Schedule schedule, Court court, [WheaterDay? wheater]) async {
    final isar = await db;
    final newSchedule = schedule
    ..court.value = court;

    if( wheater != null ){
      newSchedule..chanceOfRain = wheater.dailyChanceOfRain
      ..willItRain = wheater.dailyWillItRain
      ..conditionText = wheater.condition.text
      ..icon = wheater.condition.icon;
    }
    
    final courtHasSchedule = await court.schedules.filter()
    .initialDateEqualTo(schedule.initialDate).findFirst();

    final existingSchedules = await isar.schedules.where().filter()
    .initialDateLessThan(schedule.endDate)
    .endDateGreaterThan(schedule.initialDate)
    .court((q) => q.idEqualTo(court.id)).findAll();
    

    if( existingSchedules.isNotEmpty ) throw CustomError(message: 'La cancha ${court.name} está ocupada en el rango de tiempo especificado');

    if( courtHasSchedule != null) throw CustomError(message: 'Horario para esta cancha no disponible');

    try {
      await isar.writeTxn(() async{
      await isar.schedules.put(newSchedule);
      await schedule.court.save();
    });
    } on IsarError catch (e) {
      if(e.message == 'Unique index violated.'){
        throw CustomError(message: 'Esta hora no esta disponible');
      }
    }catch (e){
      throw CustomError(message: 'seleccione la fecha');
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