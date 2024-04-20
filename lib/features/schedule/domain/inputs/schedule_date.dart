import 'package:formz/formz.dart';

enum ScheduleDateError { empty }

class ScheduleDate extends FormzInput<DateTime, ScheduleDateError> {

  const ScheduleDate.pure(super.value) : super.pure();
  
  const ScheduleDate.dirty(super.value) : super.dirty();

  String? get errorMessage {

    if( isValid || isPure ) return null;

    if( displayError == ScheduleDateError.empty ) return 'Debe seleccionar una fecha';

    return null;
  }




  @override
  ScheduleDateError? validator(DateTime value) {

    if( value.toString().isEmpty || value.toString().trim().isEmpty ) return ScheduleDateError.empty;
      
    return null;
  }

}


