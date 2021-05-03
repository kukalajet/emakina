import 'package:formz/formz.dart';
import 'package:fuel_repository/fuel_repository.dart';

enum FuelsFieldValidationError { invalid }

class FuelsField extends FormzInput<List<Fuel>, FuelsFieldValidationError> {
  const FuelsField.pure() : super.pure(null);
  const FuelsField.dirty(List<Fuel> value) : super.dirty(value);

  @override
  FuelsFieldValidationError validator(List<Fuel> value) {
    for (final fuel in value) {
      if (fuel.id == null || fuel.type == null)
        return FuelsFieldValidationError.invalid;
    }

    return null;
  }
}
