

import 'package:formz/formz.dart';

enum ScheduleDateError { invalid }

class ScheduleDate extends FormzInput <DateTime?, ScheduleDateError> {

   ScheduleDate.pure() : super.pure(DateTime.now());
  const ScheduleDate.dirty(super.value) : super.dirty();



  String? get errorMessage {
    if( isValid || isPure ) return null;

  if ( displayError == ScheduleDateError.invalid ) return 'Fecha es requerida';

  return null;
  }


  @override
  ScheduleDateError? validator(DateTime? value) {
    if( value == null ) return ScheduleDateError.invalid;
    return null;
  }

}