

  import 'package:tennis_court/features/schedule/domain/domain.dart';
import '../infrastructure.dart';

class ScheduleRepositoryImpl extends ScheduleRepository{

  final ScheduleDatasource datasource;

  ScheduleRepositoryImpl({ScheduleDatasource? datasource}):datasource = datasource ?? ScheduleDatasourceImpl();

  @override
  Future<void> createSchedule({required DateTime date, required DateTime time, required String userName}) {
    return datasource.createSchedule(date: date, time: time, userName: userName);
  }

  @override
  Future<void> deleteSchedule(Schedule schedule) {
    return datasource.deleteSchedule(schedule);
  }

  @override
  Future<List<Schedule>> loadSchedules() {
    return datasource.loadSchedules();
  }

  @override
  Future<Schedule> getScheduleByCourt(int courtId) {
    return datasource.getScheduleByCourt(courtId);
  }

}