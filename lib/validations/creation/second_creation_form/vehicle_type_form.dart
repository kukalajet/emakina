import 'package:formz/formz.dart';
import 'package:vehicle_type_repository/vehicle_type_repository.dart';

enum VehicleTypeFieldValidationError { invalid }

class VehicleTypeField
    extends FormzInput<VehicleType, VehicleTypeFieldValidationError> {
  const VehicleTypeField.pure()
      : super.pure(const VehicleType(id: null, name: null));
  const VehicleTypeField.dirty(VehicleType value) : super.dirty(value);

  @override
  VehicleTypeFieldValidationError validator(VehicleType value) {
    if (value.id == null || value.name == null)
      return VehicleTypeFieldValidationError.invalid;
    return null;
  }
}
