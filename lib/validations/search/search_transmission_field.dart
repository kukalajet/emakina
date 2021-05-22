import 'package:formz/formz.dart';
import 'package:transmission_repository/transmission_repository.dart';

enum SearchTransmissionFieldValidationError { invalid }

class SearchTransmissionField
    extends FormzInput<Transmission, SearchTransmissionFieldValidationError> {
  const SearchTransmissionField.pure()
      : super.pure(const Transmission(id: null, type: null));
  const SearchTransmissionField.dirty(Transmission value) : super.dirty(value);

  @override
  SearchTransmissionFieldValidationError validator(Transmission value) => null;
}
