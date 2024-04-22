import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tennis_court/features/api/domain/domain.dart';
import '../presentation.dart';

final dateWheaterProvider = StateNotifierProvider<DateWheaterNotifier,DateWheaterState >((ref) {

  final dateWheaterRepository = ref.watch(dateWheaterRepositoryProvider);

  return DateWheaterNotifier(
    dateWheaterRepository: dateWheaterRepository);
});

class DateWheaterNotifier extends StateNotifier<DateWheaterState> {
  final DateWheaterRepository dateWheaterRepository;
  DateWheaterNotifier({
    required this.dateWheaterRepository
  }): super(DateWheaterState());
  
  Future<DateWheater> getWheaterByDate( DateTime date ) async {

    final diference = date.difference(DateTime.now()).inDays + 2;

    final days = ( diference == 0 ) ? 1 : diference;
    print(diference);
    final dateWheater = await dateWheaterRepository.getWheaterByDate(days: days);

    state = state.copyWith(
      dateWheater: dateWheater
    );
    return dateWheater;
  }



}

class DateWheaterState {

    final DateWheater? dateWheater;
    final bool isLoading;

  DateWheaterState({
     this.dateWheater,
    this.isLoading = false
    });

    DateWheaterState copyWith({
      DateWheater? dateWheater,
      bool? isLoading,
    }) => DateWheaterState(
      dateWheater: dateWheater ?? this.dateWheater,
      isLoading: isLoading ?? this.isLoading
    );

  }