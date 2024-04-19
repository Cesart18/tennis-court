import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tennis_court/features/court/domain/domain.dart';
import 'package:tennis_court/features/court/presentation/providers/court_repository_provider.dart';


final courtsProvider = StateNotifierProvider<CourtsNotifier, CourtsState>((ref) {

    final initCallback = ref.watch(courtRepositoryProvider).initCourtDb;
    final checkCallback = ref.watch(courtRepositoryProvider).checkCourts;
    final getCallback = ref.watch(courtRepositoryProvider).getCourts;

    return CourtsNotifier(initCallback: initCallback, checkCallback: checkCallback, getCallback: getCallback);

});



class CourtsNotifier extends StateNotifier<CourtsState> {
  final Function() initCallback;
  final Function() checkCallback;
  final Function() getCallback;
  CourtsNotifier({
    required this.initCallback,
    required this.checkCallback,
    required this.getCallback
  }): super(CourtsState()){
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

class CourtsState {

  final List<Court> courts;

  CourtsState({
     this.courts = const []
     });

  CourtsState copyWith({
    List<Court>? courts
  }) => CourtsState(
    courts: courts ?? this.courts
  );
  

  }