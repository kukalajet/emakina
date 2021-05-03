import 'package:formz/formz.dart';

enum TitleFieldValidationError { invalid }

class TitleField extends FormzInput<String, TitleFieldValidationError> {
  const TitleField.pure() : super.pure("");
  const TitleField.dirty(String value) : super.dirty(value);

  @override
  TitleFieldValidationError validator(String value) {
    if (value.isEmpty) return TitleFieldValidationError.invalid;
    return null;
  }
}
