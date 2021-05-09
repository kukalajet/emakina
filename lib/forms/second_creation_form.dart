import 'package:emakina/widgets/lists/lists.dart';
import 'package:emakina/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:emakina/blocs/creation/creation.dart';

class SecondCreationForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<SecondCreationFormBloc, SecondCreationFormState>(
      listener: (context, state) {
        if (state.valid)
          context
              .read<CreationWizardBloc>()
              .add(SecondCreationFormStateChanged(state));
      },
      child: Align(
        alignment: const Alignment(0, -1 / 3),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(padding: EdgeInsets.all(8.0)),
            _ManufacturerInput(),
          ],
        ),
      ),
    );
  }
}

class _ManufacturerInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SecondCreationFormBloc, SecondCreationFormState>(
      buildWhen: (previous, current) =>
          previous.manufacturer != current.manufacturer,
      builder: (context, state) {
        return TextFormPickerField(
          value: context
              .read<SecondCreationFormBloc>()
              .state
              .manufacturer
              .value
              .name,
          labelText: 'Manufacturer',
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          picker: ManufacturerList(
            onTap: (manufacturer) {
              context
                  .read<SecondCreationFormBloc>()
                  .add(CreationManufacturerChanged(manufacturer: manufacturer));
              Navigator.pop(context);
            },
          ),
        );
      },
    );
  }
}
