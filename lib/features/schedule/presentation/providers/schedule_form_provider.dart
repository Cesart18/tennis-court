import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tennis_court/features/court/domain/domain.dart';
import 'package:tennis_court/features/court/presentation/presentation.dart';
import 'package:tennis_court/features/schedule/domain/domain.dart';
import 'package:tennis_court/features/schedule/presentation/presentation.dart';

final scheduleFormProvider = StateNotifierProvider<ScheduleFormNotifier, ScheduleFormState>((ref) {
  final courst = ref.watch(courtsProvider).courts;
  final scheduleCallback = ref.watch(schedulesProvider.notifier).createSchedule;
  return ScheduleFormNotifier(court: courst[0],
  scheduleCallback: scheduleCallback);
});


class ScheduleFormNotifier extends StateNotifier<ScheduleFormState> {
  final Function( Schedule, Court ) scheduleCallback;
  ScheduleFormNotifier({
    required Court court,
    required this.scheduleCallback
  }): super(ScheduleFormState(court: court, time: TimeOfDay.now(), date: DateTime.now() ));

// TODO: hacer las validaciones de los inputs y de las canchas


  onCourtSelectChange( Court court ){
    state = state.copyWith(
      court: court,
    );
  }

  onUserNameChanged( String name ){
    state = state.copyWith(
      userName: name,
    );
  }

  onTimeChanged( TimeOfDay time ){
    state = state.copyWith(
      time: time
    );
  }
  onDateChanged( DateTime date ){
    state = state.copyWith(
      date: date
    );
  }

  onFormSubmit() async {
    _touchEveryField();

  final parseTime = state.time.hour * 60 + state.time.hour;

  final newSchedule = Schedule(date: state.date, time: parseTime, userName: state.userName);

    await scheduleCallback(newSchedule, state.court);
  }

  _touchEveryField(){
    state = state.copyWith(
      isFormPosted: true
    );
  }
  
}



class ScheduleFormState {

    final String userName;
    final Court court;
    final DateTime date;
    final TimeOfDay time;
    final bool isFormPosted;

  ScheduleFormState({
     this.userName = '',
     required this.court,
     this.isFormPosted = false, 
     required this.date,
     required this.time,
     });

  ScheduleFormState copyWith({
    String? userName,
    Court? court,
    DateTime? date,
    TimeOfDay? time,
    bool? isFormPosted,
  }) => ScheduleFormState(
    userName: userName ?? this.userName,
    court: court ?? this.court,
    date: date ?? this.date,
    time: time ?? this.time,
    isFormPosted: isFormPosted ?? this.isFormPosted
  );

  }