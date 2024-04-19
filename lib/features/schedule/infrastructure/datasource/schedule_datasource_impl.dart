

  import 'package:tennis_court/features/schedule/domain/domain.dart';

class ScheduleDatasourceImpl extends ScheduleDatasource{
  

  @override
  Future<void> createSchedule({required DateTime date, required DateTime time, required String userName}) {
    // TODO: implement createSchedule
    throw UnimplementedError();
  }

  @override
  Future<void> deleteSchedule(Schedule schedule) {
    // TODO: implement deleteSchedule
    throw UnimplementedError();
  }

  @override
  Future<Schedule> getScheduleByCourt(int courtId) {
    // TODO: implement getScheduleByCourt
    throw UnimplementedError();
  }

  @override
  Future<List<Schedule>> loadSchedules() {
    // TODO: implement loadSchedules
    throw UnimplementedError();
  }
  
  
  

}