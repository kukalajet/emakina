import 'package:formz/formz.dart';

enum DescriptionFieldValidationError { invalid }

class DescriptionField
    extends FormzInput<String, DescriptionFieldValidationError> {
  const DescriptionField.pure() : super.pure("");
  const DescriptionField.dirty(String value) : super.dirty(value);

  @override
  DescriptionFieldValidationError validator(String value) {
    if (value.isEmpty) return DescriptionFieldValidationError.invalid;
    return null;
  }
}
