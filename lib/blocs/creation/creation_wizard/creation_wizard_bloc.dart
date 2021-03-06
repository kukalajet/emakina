import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:emakina/blocs/creation/creation.dart';
import 'package:emakina/blocs/creation/first_creation_form/first_creation_form_bloc.dart';
import 'package:emakina/validations/validations.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:emakina/blocs/blocs.dart';

part 'creation_wizard_event.dart';
part 'creation_wizard_state.dart';

class CreationWizardBloc
    extends Bloc<CreationWizardEvent, CreationWizardState> {
  CreationWizardBloc() : super(CreationWizardInitial());

  @override
  Stream<CreationWizardState> mapEventToState(
    CreationWizardEvent event,
  ) async* {
    if (event is FirstCreationFormStateChanged) {
      yield _mapFirstCreationFormChangedToState(event, state);
    } else if (event is SecondCreationFormStateChanged) {
      yield _mapSecondCreationFormChangedToState(event, state);
    } else if (event is ThirdCreationFormStateChanged) {
      yield _mapThirdCreationFormChangedToState(event, state);
    } else if (event is CreationWizardStateChanged) {
      yield _mapCreationWizardChangedToState(event, state);
    } else if (event is CreationFormSubmitted) {
      yield _mapFormSubmimttedToState(event, state);
    }
  }

  CreationWizardState _mapCreationWizardChangedToState(
    CreationWizardStateChanged event,
    CreationWizardState state,
  ) {
    final currentCreationForm = event.state;
    return state.copyWith(
        creationForm: currentCreationForm,
        status: Formz.validate([
          state.firstCreationWizardForm,
          state.secondCreationWizardForm,
          state.thirdCreationWizardForm,
        ]));
  }

  CreationWizardState _mapFirstCreationFormChangedToState(
    FirstCreationFormStateChanged event,
    CreationWizardState state,
  ) {
    final firstCreationWizardForm =
        FirstCreationWizardFormInput.dirty(event.state);
    return state.copyWith(
      firstCreationWizardForm: firstCreationWizardForm,
      status: Formz.validate([
        firstCreationWizardForm,
        state.secondCreationWizardForm,
        state.thirdCreationWizardForm,
      ]),
    );
  }

  CreationWizardState _mapSecondCreationFormChangedToState(
    SecondCreationFormStateChanged event,
    CreationWizardState state,
  ) {
    final secondCreationWizardForm =
        SecondCreationWizardFormInput.dirty(event.state);
    return state.copyWith(
      secondCreationWizardForm: secondCreationWizardForm,
      status: Formz.validate([
        state.firstCreationWizardForm,
        secondCreationWizardForm,
        state.thirdCreationWizardForm,
      ]),
    );
  }

  CreationWizardState _mapThirdCreationFormChangedToState(
    ThirdCreationFormStateChanged event,
    CreationWizardState state,
  ) {
    final thirdCreationWizardForm =
        ThirdCreationWizardFormInput.dirty(event.state);
    return state.copyWith(
      thirdCreationWizardForm: thirdCreationWizardForm,
      status: Formz.validate([
        state.firstCreationWizardForm,
        state.secondCreationWizardForm,
        thirdCreationWizardForm,
      ]),
    );
  }

  // TODO: Check if it is needed.
  CreationWizardState _mapFormSubmimttedToState(
    CreationFormSubmitted event,
    CreationWizardState state,
  ) {
    return state.copyWith(status: FormzStatus.submissionSuccess);
  }
}
