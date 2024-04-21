

import 'package:formz/formz.dart';

enum ScheduleInitialDateError { invalid }

class ScheduleDate extends FormzInput <DateTime?, ScheduleInitialDateError> {

   ScheduleDate.pure() : super.pure(DateTime.now());
  const ScheduleDate.dirty(super.value) : super.dirty();



  String? get errorMessage {
    if( isValid || isPure ) return null;

  if ( displayError == ScheduleInitialDateError.invalid ) return 'Fecha es requerida';

  return null;
  }


  @override
  ScheduleInitialDateError? validator(DateTime? value) {
    if( value == null ) return ScheduleInitialDateError.invalid;
    return null;
  }

}