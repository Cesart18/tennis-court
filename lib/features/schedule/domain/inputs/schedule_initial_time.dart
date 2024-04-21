

  import 'package:flutter/material.dart';
import 'package:formz/formz.dart';

enum ScheduleInitialTimeError { invalid, isClosed }
const timeExcludes = [0,1,2,3,4,5,6,22,23];

  class ScheduleInitialTime extends FormzInput< TimeOfDay?, ScheduleInitialTimeError > {
  
   ScheduleInitialTime.pure() : super.pure(TimeOfDay.now());
  const ScheduleInitialTime.dirty(super.value) : super.dirty();
  


  String? get errorMessage {
    if( isValid || isPure ) return null;

    if( displayError == ScheduleInitialTimeError.invalid ) return 'Hora requerida';
    if( displayError == ScheduleInitialTimeError.isClosed ) return 'Horario no permitido';

    return null;
  }


  @override
  ScheduleInitialTimeError? validator(TimeOfDay? value) {
    if( value == null || value == TimeOfDay.now() ) return ScheduleInitialTimeError.invalid;
    for( int i = 0; i < timeExcludes.length; i++){
      if( value.hour == timeExcludes[i] ) return ScheduleInitialTimeError.isClosed;
    }
    return null;
  }

  }