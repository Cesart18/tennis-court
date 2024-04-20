

  import 'package:tennis_court/features/court/domain/domain.dart';
import 'package:tennis_court/features/schedule/domain/domain.dart';
import '../infrastructure.dart';

class ScheduleRepositoryImpl extends ScheduleRepository{

  final ScheduleDatasource datasource;

  ScheduleRepositoryImpl({ScheduleDatasource? datasource}):datasource = datasource ?? ScheduleDatasourceImpl();

  @override
  Future<void> createSchedule({ required Schedule schedule, required Court court }) {
    return datasource.createSchedule(schedule: schedule, court: court);
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