import 'package:formz/formz.dart';
import 'package:valute_repository/valute_repository.dart';

enum ValuteFieldValidationError { invalid }

class ValuteField extends FormzInput<Valute, ValuteFieldValidationError> {
  const ValuteField.pure()
      : super.pure(const Valute(id: null, name: null, symbol: null));
  const ValuteField.dirty(Valute value) : super.dirty(value);

  @override
  ValuteFieldValidationError validator(Valute value) {
    if (value.id == null || value.name == null || value.symbol == null)
      return ValuteFieldValidationError.invalid;

    return null;
  }
}
