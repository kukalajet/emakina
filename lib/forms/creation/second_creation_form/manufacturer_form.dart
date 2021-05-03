import 'package:formz/formz.dart';
import 'package:manufacturer_repository/manufacturer_repository.dart';

enum ManufacturerFieldValidationError { invalid }

class ManufacturerField
    extends FormzInput<Manufacturer, ManufacturerFieldValidationError> {
  const ManufacturerField.pure()
      : super.pure(const Manufacturer(id: null, name: null));
  const ManufacturerField.dirty(Manufacturer value) : super.dirty(value);

  @override
  ManufacturerFieldValidationError validator(Manufacturer value) {
    if (value.id == null || value.name == null)
      return ManufacturerFieldValidationError.invalid;
    return null;
  }
}
