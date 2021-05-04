import 'package:formz/formz.dart';
import 'package:location_repository/location_repository.dart';

enum LocationFieldValidationError { invalid }

class LocationField extends FormzInput<Location, LocationFieldValidationError> {
  const LocationField.pure() : super.pure(const Location(id: null, name: null));
  const LocationField.dirty(Location value) : super.dirty(value);

  @override
  LocationFieldValidationError validator(Location value) {
    if (value.id == null || value.name == null)
      return LocationFieldValidationError.invalid;
    return null;
  }
}
