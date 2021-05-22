import 'package:formz/formz.dart';
import 'package:valute_repository/valute_repository.dart';

enum SearchPriceFieldValidationError { invalid }

class SearchPriceField
    extends FormzInput<List<Price>, SearchPriceFieldValidationError> {
  const SearchPriceField.pure() : super.pure(const <Price>[]);
  const SearchPriceField.dirty(List<Price> value) : super.dirty(value);

  @override
  SearchPriceFieldValidationError validator(List<Price> value) => null;
}
