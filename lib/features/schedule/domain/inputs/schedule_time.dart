import 'package:formz/formz.dart';

enum TimeError { empty }

class Scheduletime extends FormzInput<DateTime, TimeError> {

  const Scheduletime.pure(super.value) : super.pure();
  
  const Scheduletime.dirty(super.value) : super.dirty();

  String? get errorMessage {

    if( isValid || isPure ) return null;

    if( displayError == TimeError.empty ) return 'Debe seleccionar una hora';

    return null;
  }




  @override
  TimeError? validator(DateTime value) {

    if( value.toString().isEmpty || value.toString().trim().isEmpty ) return TimeError.empty;
      
    return null;
  }

}


