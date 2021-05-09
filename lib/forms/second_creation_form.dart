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
            const Padding(padding: EdgeInsets.all(8.0)),
            _ModelInput(),
            const Padding(padding: EdgeInsets.all(8.0)),
            _MileageInput(),
            const Padding(padding: EdgeInsets.all(8.0)),
            _TypeInput(),
            const Padding(padding: EdgeInsets.all(8.0)),
            _PlateInput(),
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

class _ModelInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SecondCreationFormBloc, SecondCreationFormState>(
      buildWhen: (previous, current) =>
          previous.manufacturer != current.manufacturer,
      builder: (context, state) {
        final int manufacturerId = state.manufacturer.value.id;

        return TextFormPickerField(
          value: context.read<SecondCreationFormBloc>().state.model.value.name,
          labelText: 'Model',
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          picker: manufacturerId != null
              ? ModelList(
                  manufaturerId: manufacturerId,
                  onTap: (model) {
                    context
                        .read<SecondCreationFormBloc>()
                        .add(CreationModelChanged(model: model));
                    Navigator.pop(context);
                  },
                )
              : Center(child: Text('You must choose a manufacturer first.')),
        );
      },
    );
  }
}

class _MileageInput extends StatelessWidget {
  int _parse(String mileage) {
    if (mileage.isEmpty) return 0;
    return int.parse(mileage);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SecondCreationFormBloc, SecondCreationFormState>(
      buildWhen: (previous, current) => previous.mileage != current.mileage,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: TextFormField(
            initialValue: state.mileage.value != null
                ? state.mileage.value.toStringAsFixed(0)
                : null,
            onChanged: (String mileage) => context
                .read<SecondCreationFormBloc>()
                .add(CreationMileageChanged(mileage: _parse(mileage))),
            maxLines: null,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey.shade200,
              labelText: 'Mileage',
              suffixText: 'KM',
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

class _TypeInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SecondCreationFormBloc, SecondCreationFormState>(
      buildWhen: (previous, current) =>
          previous.vehicleType != current.vehicleType,
      builder: (context, state) {
        return TextFormPickerField(
          value: context
              .read<SecondCreationFormBloc>()
              .state
              .vehicleType
              .value
              .name,
          labelText: 'Vehicle Type',
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          picker: VehicleTypeList(
            onTap: (vehicleType) {
              context
                  .read<SecondCreationFormBloc>()
                  .add(CreationVehicleTypeChanged(vehicleType: vehicleType));
              Navigator.pop(context);
            },
          ),
        );
      },
    );
  }
}

class _PlateInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SecondCreationFormBloc, SecondCreationFormState>(
      buildWhen: (previous, current) => previous.plate != current.plate,
      builder: (context, state) {
        return TextFormPickerField(
          value: context.read<SecondCreationFormBloc>().state.plate.value.name,
          labelText: 'Plate',
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          picker: PlateList(
            onTap: (plate) {
              context
                  .read<SecondCreationFormBloc>()
                  .add(CreationPlateChanged(plate: plate));
              Navigator.pop(context);
            },
          ),
        );
      },
    );
  }
}
