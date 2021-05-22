import 'package:formz/formz.dart';
import 'package:listing_repository/listing_repository.dart';

enum SearchMatriculationFieldValidationError { invalid }

class SearchMatriculationField
    extends FormzInput<List<Date>, SearchMatriculationFieldValidationError> {
  const SearchMatriculationField.pure() : super.pure(const <Date>[]);
  const SearchMatriculationField.dirty(List<Date> value) : super.dirty(value);

  @override
  SearchMatriculationFieldValidationError validator(List<Date> value) => null;
}
