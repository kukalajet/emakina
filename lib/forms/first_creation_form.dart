import 'package:emakina/blocs/creation/creation.dart';
import 'package:emakina/blocs/creation/first_creation_form/first_creation_form_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FirstCreationForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<FirstCreationFormBloc, FirstCreationFormState>(
      listener: (context, state) {
        if (state.valid)
          context
              .read<CreationWizardBloc>()
              .add(FirstCreationFormStateChanged(state));
      },
      child: Align(
        alignment: const Alignment(0, -1 / 3),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(padding: EdgeInsets.all(8.0)),
            _TitleInput(),
            const Padding(padding: EdgeInsets.all(8.0)),
            _DescriptionInput(),
          ],
        ),
      ),
    );
  }
}

class _TitleInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FirstCreationFormBloc, FirstCreationFormState>(
      buildWhen: (previous, current) => previous.title != current.title,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: TextFormField(
            onChanged: (String title) => context
                .read<FirstCreationFormBloc>()
                .add(CreationTitleChanged(title: title)),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey.shade200,
              labelText: 'Title',
              labelStyle: TextStyle(
                color: Colors.red.shade800,
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red.shade800, width: 2.0),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _DescriptionInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FirstCreationFormBloc, FirstCreationFormState>(
      buildWhen: (previous, current) => previous.title != current.title,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: TextFormField(
            onChanged: (String description) => context
                .read<FirstCreationFormBloc>()
                .add(CreationDescriptionChanged(description: description)),
            maxLines: null,
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey.shade200,
              labelText: 'Description',
              labelStyle: TextStyle(
                color: Colors.red.shade800,
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red.shade800, width: 2.0),
              ),
            ),
          ),
        );
      },
    );
  }
}
