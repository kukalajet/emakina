part of 'third_creation_form_bloc.dart';

abstract class ThirdCreationFormEvent extends Equatable {
  const ThirdCreationFormEvent();

  @override
  List<Object> get props => [];
}

class CreationColorChanged extends ThirdCreationFormEvent {
  const CreationColorChanged({this.color});

  final Color color;

  @override
  List<Object> get props => [color];
}

class CreationFuelChanged extends ThirdCreationFormEvent {
  const CreationFuelChanged({this.fuel});

  final Fuel fuel;

  @override
  List<Object> get props => [fuel];
}

class CreationImageAdded extends ThirdCreationFormEvent {
  const CreationImageAdded({this.image});

  final String image;

  @override
  List<Object> get props => [image];
}

class CreationImageRemoved extends ThirdCreationFormEvent {
  const CreationImageRemoved({this.image});

  final String image;

  @override
  List<Object> get props => [image];
}

class CreationTransmissionChanged extends ThirdCreationFormEvent {
  const CreationTransmissionChanged({this.transmission});

  final Transmission transmission;

  @override
  List<Object> get props => [transmission];
}
