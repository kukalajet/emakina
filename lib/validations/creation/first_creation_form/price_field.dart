import 'package:formz/formz.dart';

enum PriceFieldValidationError { invalid }

class PriceField extends FormzInput<double, PriceFieldValidationError> {
  const PriceField.pure() : super.pure(null);
  const PriceField.dirty(double value) : super.dirty(value);

  @override
  PriceFieldValidationError validator(double value) {
    if (value == null) return PriceFieldValidationError.invalid;
    return null;
  }
}
