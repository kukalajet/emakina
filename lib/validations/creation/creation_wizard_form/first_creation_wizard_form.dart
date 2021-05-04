import 'package:emakina/blocs/blocs.dart';
import 'package:formz/formz.dart';

enum FirstCreationWizardFormInputValidationError { invalid }

class FirstCreationWizardFormInput extends FormzInput<FirstCreationFormState,
    FirstCreationWizardFormInputValidationError> {
  const FirstCreationWizardFormInput.pure()
      : super.pure(const FirstCreationFormState());
  const FirstCreationWizardFormInput.dirty(FirstCreationFormState value)
      : super.dirty(value);

  @override
  FirstCreationWizardFormInputValidationError validator(
    FirstCreationFormState value,
  ) {
    if (!value.valid)
      return FirstCreationWizardFormInputValidationError.invalid;
    return null;
  }
}
