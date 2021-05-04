import 'package:emakina/blocs/creation/creation.dart';
import 'package:emakina/forms/forms.dart';
import 'package:emakina/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class CreationScreen extends StatelessWidget {
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
        )
      ],
      child: Material(
        child: CupertinoScaffold(
          transitionBackgroundColor: Colors.white,
          body: BlocConsumer<CreationWizardBloc, CreationWizardState>(
            listener: (context, state) {},
            builder: (context, state) {
              return SingleChildScrollView(
                primary: true,
                // child: Center(child: Text("Hello World!")),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32.0,
                        vertical: 24.0,
                      ),
                      child: StepTracker(),
                    ),
                    FirstCreationForm(),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
