import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tennis_court/features/court/domain/entities/court.dart';
import 'package:tennis_court/features/schedule/domain/domain.dart';
import '../presentation.dart';

final schedulesProvider =
    StateNotifierProvider<SchedulesNotifier, SchedulesState>((ref) {
  final scheduleRepository = ref.watch(schedulesRepositoryProvider);
  return SchedulesNotifier(scheduleRepository: scheduleRepository);
});

class SchedulesNotifier extends StateNotifier<SchedulesState> {
  final ScheduleRepository scheduleRepository;
  SchedulesNotifier({required this.scheduleRepository})
      : super(SchedulesState());

  Future<void> createSchedule(Schedule schedule, Court court) async {
    await scheduleRepository.createSchedule(schedule, court);
    schedule.courts.add(court);
    state = state.copyWith(schedules: [...state.schedules, schedule]);
  }
}

class SchedulesState {
  final List<Schedule> schedules;

  SchedulesState({this.schedules = const []});

  SchedulesState copyWith({List<Schedule>? schedules}) =>
      SchedulesState(schedules: schedules ?? this.schedules);
}
