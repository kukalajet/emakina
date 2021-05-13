import 'package:emakina/blocs/creation/creation.dart';
import 'package:emakina/widgets/lists/lists.dart';
import 'package:emakina/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThirdCreationForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<ThirdCreationFormBloc, ThirdCreationFormState>(
      listener: (context, state) {
        if (state.valid)
          context
              .read<CreationWizardBloc>()
              .add(ThirdCreationFormStateChanged(state));
      },
      child: Align(
        alignment: const Alignment(0, -1 / 3),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(padding: EdgeInsets.all(8.0)),
            _TransmissionInput(),
            const Padding(padding: EdgeInsets.all(8.0)),
            _FuelInput(),
            const Padding(padding: EdgeInsets.all(8.0)),
            _ColorInput(),
            const Padding(padding: EdgeInsets.all(8.0)),
            _ImagesInput()
          ],
        ),
      ),
    );
  }
}

class _TransmissionInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThirdCreationFormBloc, ThirdCreationFormState>(
      buildWhen: (previous, current) =>
          previous.transmission != current.transmission,
      builder: (context, state) {
        return TextFormPickerField(
          value: context
              .read<ThirdCreationFormBloc>()
              .state
              .transmission
              .value
              .type,
          labelText: 'Transmission',
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          picker: TransmissionList(
            onTap: (transmission) {
              context
                  .read<ThirdCreationFormBloc>()
                  .add(CreationTransmissionChanged(transmission: transmission));
              Navigator.pop(context);
            },
          ),
        );
      },
    );
  }
}

class _FuelInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThirdCreationFormBloc, ThirdCreationFormState>(
      buildWhen: (previous, current) => previous.fuel != current.fuel,
      builder: (context, state) {
        return TextFormPickerField(
          value: context.read<ThirdCreationFormBloc>().state.fuel.value.type,
          labelText: 'Fuel',
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          picker: FuelList(
            onTap: (fuel) {
              context
                  .read<ThirdCreationFormBloc>()
                  .add(CreationFuelChanged(fuel: fuel));
              Navigator.pop(context);
            },
          ),
        );
      },
    );
  }
}

class _ColorInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThirdCreationFormBloc, ThirdCreationFormState>(
      buildWhen: (previous, current) => previous.color != current.color,
      builder: (context, state) {
        return TextFormPickerField(
          value: context.read<ThirdCreationFormBloc>().state.color.value.name,
          labelText: 'Color',
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          picker: ColorList(
            onTap: (color) {
              context
                  .read<ThirdCreationFormBloc>()
                  .add(CreationColorChanged(color: color));
              Navigator.pop(context);
            },
          ),
        );
      },
    );
  }
}

class _ImagesInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThirdCreationFormBloc, ThirdCreationFormState>(
      buildWhen: (previous, current) => previous.images != current.images,
      builder: (context, state) {
        return ImagePickerField(
          images: context.read<ThirdCreationFormBloc>().state.images.value,
          onAdd: (String image) => {
            context
                .read<ThirdCreationFormBloc>()
                .add(CreationImageAdded(image: image))
          },
          onRemove: (String image) => {
            context
                .read<ThirdCreationFormBloc>()
                .add(CreationImageRemoved(image: image))
          },
        );
      },
    );
  }
}
