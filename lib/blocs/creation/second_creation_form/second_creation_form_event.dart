part of 'second_creation_form_bloc.dart';

abstract class SecondCreationFormEvent extends Equatable {
  const SecondCreationFormEvent();

  @override
  List<Object> get props => [];
}

class CreationManufacturerChanged extends SecondCreationFormEvent {
  const CreationManufacturerChanged({this.manufacturer});

  final Manufacturer manufacturer;

  @override
  List<Object> get props => [manufacturer];
}

class CreationMileageChanged extends SecondCreationFormEvent {
  const CreationMileageChanged({this.mileage});

  final int mileage;

  @override
  List<Object> get props => [mileage];
}

class CreationModelChanged extends SecondCreationFormEvent {
  const CreationModelChanged({this.model});

  final Model model;

  @override
  List<Object> get props => [model];
}

class CreationPlateChanged extends SecondCreationFormEvent {
  const CreationPlateChanged({this.plate});

  final Plate plate;

  @override
  List<Object> get props => [plate];
}

class CreationVehicleTypeChanged extends SecondCreationFormEvent {
  const CreationVehicleTypeChanged({this.vehicleType});

  final VehicleType vehicleType;

  @override
  List<Object> get props => [vehicleType];
}
