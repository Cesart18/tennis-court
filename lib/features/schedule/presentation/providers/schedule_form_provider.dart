import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
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
  }): super(ScheduleFormState(court: court));

  onCourtSelectChange( Court court ){
    state = state.copyWith(
      court: court,
    );
  }

  onUserNameChanged( String name ){
    final newName = ScheduleUserName.dirty(name);
    state = state.copyWith(
      userName: newName,
      isValid: Formz.validate([ newName, state.date!, state.time! ])
    );
  }

  onDateChanged( DateTime date ){
    final newDate = ScheduleDate.dirty(date);
    state = state.copyWith(
      date: newDate,
      isValid: Formz.validate([ newDate, state.userName, state.time! ])
    );
  }

  onTimeChanged( TimeOfDay time ){
    final newTime = ScheduleTime.dirty(time);
    state = state.copyWith(
      time: newTime,
      isValid: Formz.validate([ newTime, state.userName, state.date!])
    );
  }

  onFormSubmit() async {
    _touchEveryField();
    if( !state.isValid ) return;


  final parseTime =  '${state.time!.value!.hour}:${state.time!.value!.hour}';
  final newSchedule = Schedule(date: state.date!.value!, time: parseTime, userName: state.userName.value);

    await scheduleCallback(newSchedule, state.court);
  }

  _touchEveryField(){
    final userName = ScheduleUserName.dirty(state.userName.value);
    final date = ScheduleDate.dirty(state.date?.value);
    final time = ScheduleTime.dirty(state.time?.value);
    state = state.copyWith(
      userName: userName,
      date: date,
      time: time,
      isValid: Formz.validate([ userName, date, time ]),
      isFormPosted: true
    );
    
  }

}



class ScheduleFormState {

    final ScheduleUserName userName;
    final Court court;
    final ScheduleDate? date;
    final ScheduleTime? time;
    final bool isFormPosted;
    final bool isValid;


  ScheduleFormState({
     this.userName = const ScheduleUserName.pure(),
     required this.court,
      this.date ,
      this.time,
     this.isFormPosted = false, 
     this.isValid = false,
     });

  ScheduleFormState copyWith({
    ScheduleUserName? userName,
    Court? court,
    ScheduleDate? date,
    ScheduleTime? time,
    bool? isFormPosted,
    bool? isValid,
  }) => ScheduleFormState(
    userName: userName ?? this.userName,
    court: court ?? this.court,
    date: date ?? this.date,
    time: time ?? this.time,
    isFormPosted: isFormPosted ?? this.isFormPosted,
    isValid: isValid ?? this.isValid,
  );

  }