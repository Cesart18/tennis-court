

  import 'package:isar/isar.dart';
import 'package:tennis_court/features/court/domain/entities/court.dart';
import 'package:tennis_court/features/schedule/domain/domain.dart';
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
    await isar.writeTxn(() async{
      await isar.schedules.put(newSchedule);
      await schedule.courts.save();
      
    });
  }

  @override
  Future<void> deleteSchedule(Schedule schedule) {
    // TODO: implement deleteSchedule
    throw UnimplementedError();
  }

  @override
  Future<List<Schedule>> getScheduleByCourt(int courtId) async {
    final isar = await db;
    final schedule = await isar.schedules.filter().courts((q) => q.idEqualTo(courtId))
    .findAll();
    return Future.value(schedule);
  }

  @override
  Future<List<Schedule>> loadSchedules() {
    // TODO: implement loadSchedules
    throw UnimplementedError();
  }

  
  
  
  

}