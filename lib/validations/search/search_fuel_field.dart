import 'package:formz/formz.dart';
import 'package:fuel_repository/fuel_repository.dart';

enum SearchFuelFieldValidationError { invalid }

class SearchFuelField extends FormzInput<Fuel, SearchFuelFieldValidationError> {
  const SearchFuelField.pure() : super.pure(const Fuel(id: null, type: null));
  const SearchFuelField.dirty(Fuel value) : super.dirty(value);

  @override
  SearchFuelFieldValidationError validator(Fuel value) => null;
}
