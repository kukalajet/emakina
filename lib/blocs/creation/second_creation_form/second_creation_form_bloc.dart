import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:emakina/validations/validations.dart';
import 'package:manufacturer_repository/manufacturer_repository.dart';
import 'package:model_repository/model_repository.dart';
import 'package:plate_repository/plate_repository.dart';
import 'package:vehicle_type_repository/vehicle_type_repository.dart';

part 'second_creation_form_event.dart';
part 'second_creation_form_state.dart';

class SecondCreationFormBloc
    extends Bloc<SecondCreationFormEvent, SecondCreationFormState> {
  SecondCreationFormBloc() : super(const SecondCreationFormState());

  @override
  Stream<SecondCreationFormState> mapEventToState(
    SecondCreationFormEvent event,
  ) async* {
    if (event is CreationManufacturerChanged) {
      yield _mapCreationManufacturerChangedToState(event, state);
    } else if (event is CreationMileageChanged) {
      yield _mapCreationMileageChangedToState(event, state);
    } else if (event is CreationModelChanged) {
      yield _mapCreationModelChangedToState(event, state);
    } else if (event is CreationPlateChanged) {
      yield _mapCreationPlateChangedToState(event, state);
    } else if (event is CreationVehicleTypeChanged) {
      yield _mapCreationVehicleTypeChangedToState(event, state);
    }
  }

  SecondCreationFormState _mapCreationManufacturerChangedToState(
    CreationManufacturerChanged event,
    SecondCreationFormState state,
  ) {
    final manufacturer = ManufacturerField.dirty(event.manufacturer);
    return state.copyWith(
      manufacturer: manufacturer,
      status: Formz.validate([
        manufacturer,
        state.mileage,
        state.model,
        state.plate,
        state.vehicleType,
      ]),
    );
  }

  SecondCreationFormState _mapCreationMileageChangedToState(
    CreationMileageChanged event,
    SecondCreationFormState state,
  ) {
    final mileage = MileageField.dirty(event.mileage);
    return state.copyWith(
      mileage: mileage,
      status: Formz.validate([
        state.manufacturer,
        mileage,
        state.model,
        state.plate,
        state.vehicleType,
      ]),
    );
  }

  SecondCreationFormState _mapCreationModelChangedToState(
    CreationModelChanged event,
    SecondCreationFormState state,
  ) {
    final model = ModelField.dirty(event.model);
    return state.copyWith(
      model: model,
      status: Formz.validate([
        state.manufacturer,
        state.mileage,
        model,
        state.plate,
        state.vehicleType,
      ]),
    );
  }

  SecondCreationFormState _mapCreationPlateChangedToState(
    CreationPlateChanged event,
    SecondCreationFormState state,
  ) {
    final plate = PlateField.dirty(event.plate);
    return state.copyWith(
      plate: plate,
      status: Formz.validate([
        state.manufacturer,
        state.mileage,
        state.model,
        plate,
        state.vehicleType,
      ]),
    );
  }

  SecondCreationFormState _mapCreationVehicleTypeChangedToState(
    CreationVehicleTypeChanged event,
    SecondCreationFormState state,
  ) {
    final vehicleType = VehicleTypeField.dirty(event.vehicleType);
    return state.copyWith(
      vehicleType: vehicleType,
      status: Formz.validate([
        state.manufacturer,
        state.mileage,
        state.model,
        state.plate,
        vehicleType,
      ]),
    );
  }
}
