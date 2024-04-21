

import 'package:formz/formz.dart';

enum ScheduleEndTimeError { empty }

class ScheduleEndTime extends FormzInput<int , ScheduleEndTimeError> {

  const ScheduleEndTime.pure() : super.pure(1);
  const ScheduleEndTime.dirty(super.value) : super.dirty();


  String? get errorMessage {
    if( isValid || isPure ) return null;

    if ( displayError == ScheduleEndTimeError.empty ) return 'Debe seleccionar un tiempo para la cancha';

    return null;
  }


  @override
  ScheduleEndTimeError? validator(int value) {
    if( value == 0 ) return ScheduleEndTimeError.empty;
    return null;
  }

}