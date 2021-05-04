import 'package:emakina/blocs/blocs.dart';
import 'package:formz/formz.dart';

enum SecondCreationWizardFormInputValidationError { invalid }

class SecondCreationWizardFormInput extends FormzInput<SecondCreationFormState,
    SecondCreationWizardFormInputValidationError> {
  const SecondCreationWizardFormInput.pure()
      : super.pure(const SecondCreationFormState());
  const SecondCreationWizardFormInput.dirty(SecondCreationFormState value)
      : super.dirty(value);

  @override
  SecondCreationWizardFormInputValidationError validator(
    SecondCreationFormState value,
  ) {
    if (!value.valid)
      return SecondCreationWizardFormInputValidationError.invalid;
    return null;
  }
}
