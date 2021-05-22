import 'package:formz/formz.dart';

enum SearchMileageFieldValidationError { invalid }

class SearchMileageField
    extends FormzInput<List<double>, SearchMileageFieldValidationError> {
  const SearchMileageField.pure()
      : super.pure(const <double>[/* 0, double.infinity */]);
  const SearchMileageField.dirty(List<double> value) : super.dirty(value);

  @override
  SearchMileageFieldValidationError validator(List<double> value) => null;
}
