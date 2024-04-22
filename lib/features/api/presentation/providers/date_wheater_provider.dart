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
  
  Future<List<WheaterForecastDay>> getWheaterByDate( DateTime date ) async {

    final diference = date.difference(DateTime.now()).inDays + 2;

    final days = ( diference == 0 ) ? 1 : diference;

    final alreadyWheater = state.wheateForecastDay.any((element) => element.date == date);

    if( !alreadyWheater ){
      if( days <= 14 ){
        final dateWheater = await dateWheaterRepository.getWheaterByDays(days: days);
        state = state.copyWith(
          wheateForecastDay: [...state.wheateForecastDay, ...dateWheater.wheaterForcastDay]
        );
      }else{
        final dateWheaterByDate = await dateWheaterRepository.getWheaterByDate(date);
        state = state.copyWith(
          wheateForecastDay: [...state.wheateForecastDay, ...dateWheaterByDate.wheaterForcastDay]
        );
      }
    }

    return state.wheateForecastDay;
  }



}

class DateWheaterState {

    final List<WheaterForecastDay> wheateForecastDay;


  DateWheaterState({
     this.wheateForecastDay = const [],
    });

    DateWheaterState copyWith({
      List<WheaterForecastDay>? wheateForecastDay,
    }) => DateWheaterState(
      wheateForecastDay: wheateForecastDay ?? this.wheateForecastDay,
    );

  }