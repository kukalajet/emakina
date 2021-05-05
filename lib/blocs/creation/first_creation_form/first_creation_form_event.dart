part of 'first_creation_form_bloc.dart';

abstract class FirstCreationFormEvent extends Equatable {
  const FirstCreationFormEvent();

  @override
  List<Object> get props => [];
}

class CreationTitleChanged extends FirstCreationFormEvent {
  const CreationTitleChanged({this.title});

  final String title;

  @override
  List<Object> get props => [title];
}

class CreationDescriptionChanged extends FirstCreationFormEvent {
  const CreationDescriptionChanged({this.description});

  final String description;

  @override
  List<Object> get props => [description];
}

class CreationPriceChanged extends FirstCreationFormEvent {
  const CreationPriceChanged({this.price});

  final double price;

  @override
  List<Object> get props => [price];
}

class CreationValuteChanged extends FirstCreationFormEvent {
  const CreationValuteChanged({this.valute});

  final Valute valute;

  @override
  List<Object> get props => [valute];
}

class CreationMatriculationChanged extends FirstCreationFormEvent {
  const CreationMatriculationChanged({this.matriculation});

  final Date matriculation;

  @override
  List<Object> get props => [matriculation];
}

class CreationLocationChanged extends FirstCreationFormEvent {
  const CreationLocationChanged({this.location});

  final Location location;

  @override
  List<Object> get props => [location];
}
