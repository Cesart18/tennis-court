import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tennis_court/features/court/domain/domain.dart';
import 'package:tennis_court/features/court/presentation/providers/court_repository_provider.dart';


final courtsProvider = StateNotifierProvider<CourtNotifier, CourtState>((ref) {

    final initCallback = ref.watch(courtRepositoryProvider).initCourtDb;
    final checkCallback = ref.watch(courtRepositoryProvider).checkCourts;
    final getCallback = ref.watch(courtRepositoryProvider).getCourts;

    return CourtNotifier(initCallback: initCallback, checkCallback: checkCallback, getCallback: getCallback);

});



class CourtNotifier extends StateNotifier<CourtState> {
  final Function() initCallback;
  final Function() checkCallback;
  final Function() getCallback;
  CourtNotifier({
    required this.initCallback,
    required this.checkCallback,
    required this.getCallback
  }): super(CourtState()){
    initCourtsDb();
  }
  
  void initCourtsDb () async {
    await initCallback();
    final hasCourts = await checkCallback();
    if( hasCourts == true ){
      final courts = await getCallback();
      state = state.copyWith(
        courts: courts
      );
    }
  }

}

class CourtState {

  final List<Court> courts;

  CourtState({
     this.courts = const []
     });

  CourtState copyWith({
    List<Court>? courts
  }) => CourtState(
    courts: courts ?? this.courts
  );
  

  }