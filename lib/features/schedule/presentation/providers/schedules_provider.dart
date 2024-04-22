import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tennis_court/features/court/domain/entities/court.dart';
import 'package:tennis_court/features/schedule/domain/domain.dart';
import 'package:tennis_court/features/schedule/infrastructure/infrastructure.dart';
import '../presentation.dart';

final schedulesProvider =
    StateNotifierProvider<SchedulesNotifier, SchedulesState>((ref) {
  final scheduleRepository = ref.watch(schedulesRepositoryProvider);
  return SchedulesNotifier(scheduleRepository: scheduleRepository);
});

class SchedulesNotifier extends StateNotifier<SchedulesState> {
  final ScheduleRepository scheduleRepository;
  SchedulesNotifier({required this.scheduleRepository})
      : super(SchedulesState()){
        loadSchedules();
      }

  

  Future<void> createSchedule(Schedule schedule, Court court) async {

  final schedulesOfCourt = state.schedules.where((element) => element.court.value == court).toList();

  final schedulesByDay = schedulesOfCourt.where((element) => element.initialDate.day == schedule.initialDate.day).toList();
    


  try {
    if( schedulesByDay.length > 2 ) {
      onGetErrorMessage('Agendas de la cancha ${court.name} por dia alcanza el maximo de 3');
      throw CustomError(message: 'Agendas de la cancha ${court.name} por dia alcanza el maximo de 3');
    }
      await scheduleRepository.createSchedule(schedule, court);
    state = state.copyWith(
      schedules: [...state.schedules, schedule],
      errorMessage: ''
      );

    } on CustomError catch (e) {
      onGetErrorMessage(e.message);
    }
  }

  Future<void> deleteSchedule( Schedule schedule )async{
    await scheduleRepository.deleteSchedule(schedule);
    state = state.copyWith(
      schedules: [...state.schedules..removeWhere((element) => element.id == schedule.id)]
    );
  }

Future<void> loadSchedules() async {
  final schedules = await scheduleRepository.loadSchedules();
  state = state.copyWith(
    schedules: schedules
  );
}

Future<void> onGetErrorMessage([ String? errorMessage ]) async {
  if (state.errorMessage == errorMessage) return;
    state = state.copyWith(
      errorMessage: errorMessage
    );
  }

}


class SchedulesState {
  final List<Schedule> schedules;
  final String errorMessage;

  SchedulesState({
    this.schedules = const [],
    this.errorMessage = ''
    });

  SchedulesState copyWith({
    List<Schedule>? schedules,
    String? errorMessage,
    }) =>
      SchedulesState(
        schedules: schedules ?? this.schedules,
        errorMessage: errorMessage ?? this.errorMessage
        );
}
