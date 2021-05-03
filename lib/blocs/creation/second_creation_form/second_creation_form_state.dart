part of 'second_creation_form_bloc.dart';

class SecondCreationFormState extends Equatable {
  const SecondCreationFormState({
    this.status = FormzStatus.pure,
    this.manufacturer = const ManufacturerField.pure(),
    this.mileage = const MileageField.pure(),
    this.model = const ModelField.pure(),
    this.plate = const PlateField.pure(),
    this.vehicleType = const VehicleTypeField.pure(),
  });

  final FormzStatus status;
  final ManufacturerField manufacturer;
  final MileageField mileage;
  final ModelField model;
  final PlateField plate;
  final VehicleTypeField vehicleType;

  SecondCreationFormState copyWith({
    FormzStatus status,
    ManufacturerField manufacturer,
    MileageField mileage,
    ModelField model,
    PlateField plate,
    VehicleTypeField vehicleType,
  }) {
    return SecondCreationFormState(
      status: status ?? this.status,
      manufacturer: manufacturer ?? this.manufacturer,
      mileage: mileage ?? this.mileage,
      model: model ?? this.model,
      plate: plate ?? this.plate,
      vehicleType: vehicleType ?? this.vehicleType,
    );
  }

  bool get valid => status == FormzStatus.valid;

  @override
  List<Object> get props => [
        status,
        manufacturer,
        mileage,
        model,
        plate,
        vehicleType,
      ];
}
