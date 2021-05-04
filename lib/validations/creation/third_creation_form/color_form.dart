import 'package:formz/formz.dart';
import 'package:color_repository/color_repository.dart';

enum ColorFieldValidationError { invalid }

class ColorField extends FormzInput<Color, ColorFieldValidationError> {
  const ColorField.pure()
      : super.pure(const Color(id: null, name: null, code: null));
  const ColorField.dirty(Color value) : super.dirty(value);

  @override
  ColorFieldValidationError validator(Color value) {
    if (value.id == null || value.name == null || value.code == null)
      return ColorFieldValidationError.invalid;
    return null;
  }
}
