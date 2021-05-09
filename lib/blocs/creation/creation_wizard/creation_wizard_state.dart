part of 'creation_wizard_bloc.dart';

enum CreationForm { FirstForm, SecondForm, ThirdForm }

class CreationWizardState extends Equatable {
  const CreationWizardState({
    this.status = FormzStatus.pure,
    this.creationForm = CreationForm.FirstForm,
    this.firstCreationWizardForm = const FirstCreationWizardFormInput.pure(),
    this.secondCreationWizardForm = const SecondCreationWizardFormInput.pure(),
    this.thirdCreationWizardForm = const ThirdCreationWizardFormInput.pure(),
  });

  final FormzStatus status;
  final CreationForm creationForm;
  final FirstCreationWizardFormInput firstCreationWizardForm;
  final SecondCreationWizardFormInput secondCreationWizardForm;
  final ThirdCreationWizardFormInput thirdCreationWizardForm;

  CreationWizardState copyWith({
    FormzStatus status,
    CreationForm creationForm,
    FirstCreationWizardFormInput firstCreationWizardForm,
    SecondCreationWizardFormInput secondCreationWizardForm,
    ThirdCreationWizardFormInput thirdCreationWizardForm,
  }) {
    return CreationWizardState(
      status: status ?? this.status,
      creationForm: creationForm ?? this.creationForm,
      firstCreationWizardForm:
          firstCreationWizardForm ?? this.firstCreationWizardForm,
      secondCreationWizardForm:
          secondCreationWizardForm ?? this.secondCreationWizardForm,
      thirdCreationWizardForm:
          thirdCreationWizardForm ?? this.thirdCreationWizardForm,
    );
  }

  @override
  List<Object> get props => [
        status,
        creationForm,
        firstCreationWizardForm,
        secondCreationWizardForm,
        thirdCreationWizardForm,
      ];
}

class CreationWizardInitial extends CreationWizardState {}
