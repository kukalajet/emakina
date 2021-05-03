part of 'creation_wizard_bloc.dart';

class CreationWizardState extends Equatable {
  const CreationWizardState({
    this.status = FormzStatus.pure,
    this.firstCreationWizardForm = const FirstCreationWizardFormInput.pure(),
    this.secondCreationWizardForm = const SecondCreationWizardFormInput.pure(),
    this.thirdCreationWizardForm = const ThirdCreationWizardFormInput.pure(),
  });

  final FormzStatus status;
  final FirstCreationWizardFormInput firstCreationWizardForm;
  final SecondCreationWizardFormInput secondCreationWizardForm;
  final ThirdCreationWizardFormInput thirdCreationWizardForm;

  CreationWizardState copyWith({
    FormzStatus status,
    FirstCreationWizardFormInput firstCreationWizardForm,
    SecondCreationWizardFormInput secondCreationWizardForm,
    ThirdCreationWizardFormInput thirdCreationWizardForm,
  }) {
    return CreationWizardState(
      status: status ?? this.status,
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
        firstCreationWizardForm,
        secondCreationWizardForm,
        thirdCreationWizardForm,
      ];
}

class CreationWizardInitial extends CreationWizardState {}
