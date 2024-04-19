

import 'package:isar/isar.dart';
import 'package:tennis_court/features/court/domain/domain.dart';
import 'package:tennis_court/shared/shared.dart';

class CourtDatasourceImpl extends CourtDatasource{

  late Future<Isar> db;
  CourtDatasourceImpl(){
    db = IsarService().db;
  }

   @override
  Future<void> initCourtDb() async {
    final isar = await db;

    final courtOne = Court( id: 1 ,name: 'A');
    final courtTwo = Court( id: 2 ,name: 'B');
    final courtThre = Court( id: 3 ,name: 'C');

    await isar.writeTxn(() async{
      await isar.courts.putAll([courtOne, courtTwo, courtThre]);
    });
  }

  @override
  Future<bool> checkCourts() async {
   final isar = await db;
   final hasCourts = await isar.courts.where().isNotEmpty(); 
   return Future.value(hasCourts);
  }

  @override
  Future<List<Court>> getCourts() async{
    final isar = await db;

    final courts = await isar.courts.where().findAll();

    return Future.value(courts);
  }
  
  @override
  Future<Court> getCourtById(String id) async {
    final isar = await db;
    final courtId = int.parse(id);
    final court = await isar.courts.get(courtId);

    return Future.value(court);
  }
  
  

 

}