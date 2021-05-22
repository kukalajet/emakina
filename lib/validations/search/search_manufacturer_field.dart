import 'package:formz/formz.dart';
import 'package:manufacturer_repository/manufacturer_repository.dart';

enum SearchManufacturerFieldValidationError { invalid }

class SearchManufacturerField
    extends FormzInput<Manufacturer, SearchManufacturerFieldValidationError> {
  const SearchManufacturerField.pure()
      : super.pure(const Manufacturer(id: null, name: null));
  const SearchManufacturerField.dirty(Manufacturer value) : super.dirty(value);

  @override
  SearchManufacturerFieldValidationError validator(Manufacturer value) => null;
}
