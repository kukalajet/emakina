import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:emakina/blocs/creation/creation.dart';
import 'package:emakina/widgets/widgets.dart';
import 'package:emakina/forms/forms.dart';

class CreationScreen extends StatelessWidget {
  int _getCurrentStep(CreationForm creationForm) {
    switch (creationForm) {
      case CreationForm.FirstForm:
        return 1;
      case CreationForm.SecondForm:
        return 2;
      case CreationForm.ThirdForm:
        return 3;
    }
  }

  Widget _getCurrentForm(CreationForm creationForm) {
    switch (creationForm) {
      case CreationForm.FirstForm:
        return FirstCreationForm();
      case CreationForm.SecondForm:
        return SecondCreationForm();
      case CreationForm.ThirdForm:
        return FirstCreationForm();
      default:
        return SizedBox();
    }
  }

  Function _getOnNextPressed(
    BuildContext context,
    CreationWizardState state,
  ) {
    switch (state.creationForm) {
      case CreationForm.FirstForm:
        if (!state.firstCreationWizardForm.value.valid) return null;
        return () {
          context
              .read<CreationWizardBloc>()
              .add(CreationWizardStateChanged(CreationForm.SecondForm));
        };
      case CreationForm.SecondForm:
        if (!state.secondCreationWizardForm.value.valid) return null;
        return () {
          context
              .read<CreationWizardBloc>()
              .add(CreationWizardStateChanged(CreationForm.SecondForm));
        };
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CreationWizardBloc>(
          create: (_) => CreationWizardBloc(),
        ),
        BlocProvider<FirstCreationFormBloc>(
          create: (_) => FirstCreationFormBloc(),
        ),
        BlocProvider<SecondCreationFormBloc>(
          create: (_) => SecondCreationFormBloc(),
        ),
        BlocProvider<ThirdCreationFormBloc>(
          create: (_) => ThirdCreationFormBloc(),
        ),
      ],
      child: Material(
        child: CupertinoScaffold(
          transitionBackgroundColor: Colors.white,
          body: BlocConsumer<CreationWizardBloc, CreationWizardState>(
            listener: (context, state) {},
            builder: (context, state) {
              return Scaffold(
                resizeToAvoidBottomInset: false,
                bottomNavigationBar: CreationBottomNavigationBar(
                  onBackPressed: () {
                    if (state.creationForm == CreationForm.SecondForm)
                      context.read<CreationWizardBloc>().add(
                          CreationWizardStateChanged(CreationForm.FirstForm));
                    if (state.creationForm == CreationForm.ThirdForm)
                      context.read<CreationWizardBloc>().add(
                          CreationWizardStateChanged(CreationForm.SecondForm));
                  },
                  onNextPressed: _getOnNextPressed(context, state),
                  onSubmitPressed: () {},
                  showBack: state.creationForm != CreationForm.FirstForm,
                  showSubmit: state.creationForm == CreationForm.ThirdForm,
                ),
                body: SingleChildScrollView(
                  primary: true,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32.0,
                          vertical: 20.0,
                        ),
                        child: StepTracker(
                          currentStep: _getCurrentStep(state.creationForm),
                        ),
                      ),
                      _getCurrentForm(state.creationForm),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
