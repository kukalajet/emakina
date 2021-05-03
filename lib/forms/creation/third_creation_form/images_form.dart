import 'package:formz/formz.dart';

enum ImagesFieldValidationError { invalid }

class ImagesField extends FormzInput<List<String>, ImagesFieldValidationError> {
  const ImagesField.pure() : super.pure(null);
  const ImagesField.dirty(List<String> value) : super.dirty(value);

  @override
  ImagesFieldValidationError validator(List<String> value) {
    for (final uri in value) {
      if (uri == null || uri.isEmpty) return ImagesFieldValidationError.invalid;
    }

    return null;
  }
}
