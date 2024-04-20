import 'package:formz/formz.dart';

enum ScheduleUserNameError { empty, length }

class ScheduleUserName extends FormzInput<String, ScheduleUserNameError> {
  const ScheduleUserName.pure() : super.pure('');
  const ScheduleUserName.dirty(super.value) : super.dirty();

  String? get errorMessage {
    if ( isValid || isPure ) return null;

    if( displayError == ScheduleUserNameError.empty ) return 'Nombre obligatorio';
    if( displayError == ScheduleUserNameError.length ) return 'El nombre debe tener al menos 4 caracteres';

    return null;
  }




  @override
  ScheduleUserNameError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return ScheduleUserNameError.empty;

    if (value.length < 4) return ScheduleUserNameError.length;
    return null;
  }
}
