import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tennis_court/features/court/domain/domain.dart';
import 'package:tennis_court/features/court/presentation/presentation.dart';
import 'package:tennis_court/features/schedule/domain/domain.dart';
import 'package:tennis_court/features/schedule/presentation/presentation.dart';


final courtProvider = StateNotifierProvider.family<CourtNotifier,CourtState, String>((ref, courtId) {

  final courtRepository = ref.watch(courtRepositoryProvider);
  final scheduleRepository = ref.watch(schedulesRepositoryProvider);
  return CourtNotifier(courtRepository: courtRepository, courtId: courtId,
  scheduleRepository: scheduleRepository
  );

});


class CourtNotifier extends StateNotifier<CourtState> {
  final CourtRepository courtRepository;
  final ScheduleRepository scheduleRepository;
    CourtNotifier({
      required this.courtRepository, required String courtId,
      required this.scheduleRepository
    }): super(CourtState(id: courtId)){
      loadCourt();
    }


    Future<void> loadCourt() async{

      final court = await courtRepository.getCourtById(state.id);
      state = state.copyWith(
        court: court,
      );
    }

  Future<void> loadSchedules() async {
    await state.court!.schedule.load();
    final schedules = await scheduleRepository.getScheduleByCourt(state.court!.id);
    state = state.copyWith(
      schedules: schedules
    );

  }

  }




  class CourtState {

    final String id;
    final Court? court;
    final List<Schedule>? schedules;

  CourtState({
    required this.id,
    this.court,
    this.schedules = const []
    });

  CourtState copyWith({
    String? id,
    Court? court,
    List<Schedule>? schedules,
  }) => CourtState(
    id: id ?? this.id,
    court: court ?? this.court,
    schedules: schedules ?? this.schedules
  );


  }