import 'package:formz/formz.dart';
import 'package:plate_repository/plate_repository.dart';

enum PlateFieldValidationError { invalid }

class PlateField extends FormzInput<Plate, PlateFieldValidationError> {
  const PlateField.pure() : super.pure(const Plate(id: null, name: null));
  const PlateField.dirty(Plate value) : super.dirty(value);

  @override
  PlateFieldValidationError validator(Plate value) {
    if (value.id == null || value.name == null)
      return PlateFieldValidationError.invalid;
    return null;
  }
}
