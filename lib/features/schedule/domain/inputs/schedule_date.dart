

import 'package:formz/formz.dart';

enum ScheduleInitialDateError { invalid }

class ScheduleDate extends FormzInput <DateTime?, ScheduleInitialDateError> {

   ScheduleDate.pure() : super.pure(DateTime.now());
  const ScheduleDate.dirty(super.value) : super.dirty();



  String? get errorMessage {
    if( isValid || isPure ) return null;

  if ( displayError == ScheduleInitialDateError.invalid ) return 'Seleccione una fecha';

  return null;
  }


  @override
  ScheduleInitialDateError? validator(DateTime? value) {
    if( value == null || value.hour == DateTime.now().hour) return ScheduleInitialDateError.invalid;
    return null;
  }

}