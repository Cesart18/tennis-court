

  import 'package:flutter/material.dart';
import 'package:formz/formz.dart';

enum ScheduleTimeError { invalid }

  class ScheduleTime extends FormzInput< TimeOfDay?, ScheduleTimeError > {
  
   ScheduleTime.pure() : super.pure(TimeOfDay.now());
  const ScheduleTime.dirty(super.value) : super.dirty();
  


  String? get errorMessage {
    if( isValid || isPure ) return null;

    if( displayError == ScheduleTimeError.invalid ) return 'Hora requerida';

    return null;
  }


  @override
  ScheduleTimeError? validator(TimeOfDay? value) {
    if( value == null || value == TimeOfDay.now() ) return ScheduleTimeError.invalid;
    return null;
  }

  }