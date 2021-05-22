import 'package:formz/formz.dart';
import 'package:fuel_repository/fuel_repository.dart';

enum FuelFieldValidationError { invalid }

class FuelField extends FormzInput<Fuel, FuelFieldValidationError> {
  const FuelField.pure() : super.pure(const Fuel(id: null, type: null));
  const FuelField.dirty(Fuel value) : super.dirty(value);

  @override
  FuelFieldValidationError validator(Fuel value) {
    if (value.id == null || value.type == null)
      return FuelFieldValidationError.invalid;

    return null;
  }
}
