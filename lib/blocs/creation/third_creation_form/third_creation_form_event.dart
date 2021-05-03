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

class CreationFuelsChanged extends ThirdCreationFormEvent {
  const CreationFuelsChanged({this.fuels});

  final List<Fuel> fuels;

  @override
  List<Object> get props => [fuels];
}

class CreationImagesChanged extends ThirdCreationFormEvent {
  const CreationImagesChanged({this.images});

  final List<String> images;

  @override
  List<Object> get props => [images];
}

class CreationTransmissionChanged extends ThirdCreationFormEvent {
  const CreationTransmissionChanged({this.transmission});

  final Transmission transmission;

  @override
  List<Object> get props => [transmission];
}
