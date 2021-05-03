import 'package:emakina/blocs/blocs.dart';
import 'package:formz/formz.dart';

enum ThirdCreationWizardFormInputValidationError { invalid }

class ThirdCreationWizardFormInput extends FormzInput<ThirdCreationFormState,
    ThirdCreationWizardFormInputValidationError> {
  const ThirdCreationWizardFormInput.pure()
      : super.pure(const ThirdCreationFormState());
  const ThirdCreationWizardFormInput.dirty(ThirdCreationFormState value)
      : super.dirty(value);

  @override
  ThirdCreationWizardFormInputValidationError validator(
    ThirdCreationFormState value,
  ) {
    if (!value.valid)
      return ThirdCreationWizardFormInputValidationError.invalid;
    return null;
  }
}
