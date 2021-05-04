import 'package:formz/formz.dart';
import 'package:listing_repository/listing_repository.dart';

enum MatriculationFieldValidationError { invalid }

class MatriculationField
    extends FormzInput<Date, MatriculationFieldValidationError> {
  const MatriculationField.pure()
      : super.pure(const Date(day: null, month: null, year: null));
  const MatriculationField.dirty(Date value) : super.dirty(value);

  @override
  MatriculationFieldValidationError validator(Date value) {
    if (value.day == null || value.month == null || value.year == null)
      return MatriculationFieldValidationError.invalid;
    return null;
  }
}
