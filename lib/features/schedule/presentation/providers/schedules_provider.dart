
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tennis_court/features/court/domain/entities/court.dart';
import 'package:tennis_court/features/schedule/domain/domain.dart';
import '../presentation.dart';

final schedulesProvider = StateNotifierProvider<SchedulesNotifier, SchedulesState>((ref) {
  final scheduleRepository = ref.watch(schedulesRepositoryProvider);
  return SchedulesNotifier(scheduleRepository: scheduleRepository);
});


class SchedulesNotifier extends StateNotifier<SchedulesState> {
  final ScheduleRepository scheduleRepository;
  SchedulesNotifier({
    required this.scheduleRepository
  }): super(SchedulesState());
  
  Future<void> createSchedule ({ required DateTime date, required DateTime time, required String userName, required Court court  }) async {
    final newSchedule = Schedule(date: date, time: time, userName: userName);
    await scheduleRepository.createSchedule(schedule: newSchedule, court: court);
    newSchedule.courts.add(court);
    state = state.copyWith(
      schedules: [...state.schedules, newSchedule]
    );
    
  }
}


class SchedulesState {

    final List<Schedule> schedules;

  SchedulesState({
    this.schedules = const []
    });
    
  SchedulesState copyWith({
    List<Schedule>? schedules
  }) => SchedulesState(
    schedules: schedules ?? this.schedules
  );

  }