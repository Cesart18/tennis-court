import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tennis_court/features/court/domain/domain.dart';
import 'package:tennis_court/features/court/presentation/presentation.dart';
import 'package:tennis_court/features/schedule/domain/domain.dart';
import 'package:tennis_court/features/schedule/presentation/presentation.dart';


final courtProvider = StateNotifierProvider.family.autoDispose<CourtNotifier,CourtState, String>((ref, courtId) {

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

  
  }





  class CourtState {

    final String id;
    final Court? court;


  CourtState({
    required this.id,
    this.court,
    });

  CourtState copyWith({
    String? id,
    Court? court,
  }) => CourtState(
    id: id ?? this.id,
    court: court ?? this.court,
  );


  }