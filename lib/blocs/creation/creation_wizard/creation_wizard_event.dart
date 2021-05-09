part of 'creation_wizard_bloc.dart';

abstract class CreationWizardEvent extends Equatable {
  const CreationWizardEvent();

  @override
  List<Object> get props => [];
}

class CreationWizardStateChanged extends CreationWizardEvent {
  const CreationWizardStateChanged(this.state);

  final CreationForm state;

  @override
  List<Object> get props => [state];
}

class FirstCreationFormStateChanged extends CreationWizardEvent {
  const FirstCreationFormStateChanged(this.state);

  final FirstCreationFormState state;

  @override
  List<Object> get props => [state];
}

class SecondCreationFormStateChanged extends CreationWizardEvent {
  const SecondCreationFormStateChanged(this.state);

  final SecondCreationFormState state;

  @override
  List<Object> get props => [state];
}

class ThirdCreationFormStateChanged extends CreationWizardEvent {
  const ThirdCreationFormStateChanged(this.state);

  final ThirdCreationFormState state;

  @override
  List<Object> get props => [state];
}

class CreationFormSubmitted extends CreationWizardEvent {
  const CreationFormSubmitted();
}
