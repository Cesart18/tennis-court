import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:tennis_court/features/api/domain/domain.dart';
import 'package:tennis_court/features/api/presentation/providers/date_wheater_provider.dart';
import 'package:tennis_court/features/court/domain/domain.dart';
import 'package:tennis_court/features/court/presentation/presentation.dart';
import 'package:tennis_court/features/schedule/domain/domain.dart';
import 'package:tennis_court/features/schedule/presentation/presentation.dart';

final scheduleFormProvider = StateNotifierProvider<ScheduleFormNotifier, ScheduleFormState>((ref) {
  final courst = ref.watch(courtsProvider).courts;
  final scheduleNotifer = ref.watch(schedulesProvider.notifier);
  final dateWheaterCallback = ref.watch(dateWheaterProvider.notifier).getWheaterByDate;
  return ScheduleFormNotifier(
    court: courst[0],
  scheduleNotifer: scheduleNotifer ,
  dateWheaterCallback: dateWheaterCallback );
});


class ScheduleFormNotifier extends StateNotifier<ScheduleFormState> {
  final SchedulesNotifier scheduleNotifer;
  final Future<DateWheater>Function( DateTime ) dateWheaterCallback;
  ScheduleFormNotifier({
    required Court court,
    required this.scheduleNotifer,
    required this.dateWheaterCallback
  }): super(ScheduleFormState(court: court, date: ScheduleDate.dirty(DateTime.now()), initialTime: ScheduleInitialTime.dirty(TimeOfDay.now())  ) );



  onCourtSelectChange( Court court ){
    final schedulesOfCourt = court.schedules.toList().where((e) => e.initialDate.day == state.date.value?.day).toList();
    if( schedulesOfCourt.length > 2  ) {
      return scheduleNotifer.onGetErrorMessage('Agendas de la cancha ${court.name} por dia alcanza el maximo de 3');
    }
    scheduleNotifer.onGetErrorMessage('');
    state = state.copyWith(
      court: court,
    );
  }




  onUserNameChanged( String name ){
    final newName = ScheduleUserName.dirty(name);
    state = state.copyWith(
      userName: newName,
      isValid: Formz.validate([ newName, state.date, state.initialTime ])
    );
  }




  onDateChanged( DateTime date ) async {
    final schedulesOfCourt = state.court.schedules.toList().where((e) => e.initialDate.day == date.day).toList();
    if( schedulesOfCourt.length > 2  ) {
      return scheduleNotifer.onGetErrorMessage('Agendas de la cancha ${state.court.name} por dia alcanza el maximo de 3');
      
    }
  final wheater = await dateWheaterCallback(date);
    scheduleNotifer.onGetErrorMessage('');
    final newDate = ScheduleDate.dirty(date);
    state = state.copyWith(
      date: newDate,
      forecast: wheater.forecastDay,
      isValid: Formz.validate([ newDate, state.userName, state.initialTime ])
    );
  }




  onInitialTimeChanged( TimeOfDay time ){
    final now = DateTime.now();
    if( state.date.value!.day == DateTime.now().day && state.date.value!.month == DateTime.now().month ){
      if( time.hour < now.hour || (time.hour == now.hour && time.minute < now.minute) ){
      return scheduleNotifer.onGetErrorMessage('Elija una hora mayor a la actual');
      }
    }
    final newTime = ScheduleInitialTime.dirty(time);
    final newDate = ScheduleDate.dirty( DateTime(state.date.value!.year, state.date.value!.month, state.date.value!.day,
      newTime.value!.hour, newTime.value!.minute
    ) );
    state = state.copyWith(
      initialTime: newTime,
      date: newDate,
      isValid: Formz.validate([ newTime, state.userName, state.date])
    );
  }




  onEndTimeChanged( int value ){
    final newEndTime = ScheduleEndTime.dirty(value);
    state = state.copyWith(
      endTime: newEndTime,
      isValid: Formz.validate([ newEndTime, state.userName, state.date, state.initialTime ])
    );

  }




  onFormSubmit() async {
    _touchEveryField();
    _validateFields();

     final newEndDate = DateTime(
      state.date.value!.year,
      state.date.value!.month,
      state.date.value!.day,
      (state.date.value!.hour + state.endTime.value),
      state.date.value!.minute
    );

    if( !state.isValid) return;

  final newSchedule = Schedule(
    initialDate: state.date.value!,
   userName: state.userName.value,
   endDate: newEndDate);

    

    await scheduleNotifer.createSchedule(newSchedule, state.court, state.forecast);
  }




  _touchEveryField(){
    final userName = ScheduleUserName.dirty(state.userName.value);
    final date = ScheduleDate.dirty(state.date.value);
    final initialTime = ScheduleInitialTime.dirty(state.initialTime.value);
    final endTime = ScheduleEndTime.dirty(state.endTime.value);
    state = state.copyWith(
      userName: userName,
      date: date,
      initialTime: initialTime,
      endTime: endTime,
      isValid: Formz.validate([ userName, date, initialTime, endTime ]),
      isFormPosted: true
    );
    
  }


  _validateFields(){
    onDateChanged(state.date.value!);
    onCourtSelectChange(state.court);
  }

  bool hasConflictingSchedules() {
    final endDate = DateTime(
      state.date.value!.year,
      state.date.value!.month,
      state.date.value!.day,
      (state.date.value!.hour + state.endTime.value),
      state.date.value!.minute
    );
    for (final existingSchedule in state.court.schedules) {
      final existingStartDateTime = existingSchedule.initialDate;
      final existingEndDateTime = existingSchedule.endDate;

      if (state.date.value!.isBefore(existingEndDateTime) &&
          endDate.isAfter(existingStartDateTime)) {
        return true; 
      }
    }

    return false; 
  }

}



class ScheduleFormState {

    final ScheduleUserName userName;
    final Court court;
    final ScheduleDate date;
    final ScheduleInitialTime initialTime;
    final ScheduleEndTime endTime;
    final ForecastDay? forecast;
    final bool isFormPosted;
    final bool isValid;


  ScheduleFormState({
     this.userName = const ScheduleUserName.pure(),
     required this.court,
     required this.date ,
     this.endTime = const ScheduleEndTime.pure(),
     required this.initialTime,
     this.isFormPosted = false, 
     this.isValid = false,
     this.forecast
     });

  ScheduleFormState copyWith({
    ScheduleUserName? userName,
    Court? court,
    ScheduleDate? date,
    ScheduleEndTime? endTime,
    ScheduleInitialTime? initialTime,
    bool? isFormPosted,
    bool? isValid,
    ForecastDay? forecast,
  }) => ScheduleFormState(
    userName: userName ?? this.userName,
    court: court ?? this.court,
    date: date ?? this.date,
    endTime: endTime ?? this.endTime,
    initialTime: initialTime ?? this.initialTime,
    isFormPosted: isFormPosted ?? this.isFormPosted,
    isValid: isValid ?? this.isValid,
    forecast: forecast ?? this.forecast
  );

  }