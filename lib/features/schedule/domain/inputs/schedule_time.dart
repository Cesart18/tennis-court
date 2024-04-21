

  import 'package:flutter/material.dart';
import 'package:formz/formz.dart';

enum ScheduleTimeError { invalid, isClosed }
const timeExcludes = [0,1,2,3,4,5,6,22,23];

  class ScheduleTime extends FormzInput< TimeOfDay?, ScheduleTimeError > {
  
   ScheduleTime.pure() : super.pure(TimeOfDay.now());
  const ScheduleTime.dirty(super.value) : super.dirty();
  


  String? get errorMessage {
    if( isValid || isPure ) return null;

    if( displayError == ScheduleTimeError.invalid ) return 'Hora requerida';
    if( displayError == ScheduleTimeError.isClosed ) return 'Horario no permitido';

    return null;
  }


  @override
  ScheduleTimeError? validator(TimeOfDay? value) {
    if( value == null || value == TimeOfDay.now() ) return ScheduleTimeError.invalid;
    for( int i = 0; i < timeExcludes.length; i++){
      if( value.hour == timeExcludes[i] ) return ScheduleTimeError.isClosed;
    }
    return null;
  }

  }