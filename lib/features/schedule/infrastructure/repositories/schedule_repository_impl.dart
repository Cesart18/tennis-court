

  import 'package:tennis_court/features/schedule/domain/domain.dart';
import '../infrastructure.dart';

class ScheduleRepositoryImpl extends ScheduleRepository{

  final ScheduleDatasource datasource;

  ScheduleRepositoryImpl({ScheduleDatasource? datasource}):datasource = datasource ?? ScheduleDatasourceImpl();

  @override
  Future<void> createSchedule(DateTime date, DateTime time) {
    return datasource.createSchedule(date, time);
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