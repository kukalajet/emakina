import 'package:emakina/blocs/creation/creation.dart';
import 'package:emakina/blocs/creation/first_creation_form/first_creation_form_bloc.dart';
import 'package:emakina/widgets/lists/lists.dart';
import 'package:emakina/widgets/widgets.dart';
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
            const Padding(padding: EdgeInsets.all(8.0)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(child: _PriceInput()),
                  Expanded(child: _ValuteInput()),
                ],
              ),
            ),
            const Padding(padding: EdgeInsets.all(8.0)),
            _MatriculationInput(),
            const Padding(padding: EdgeInsets.all(8.0)),
            _LocationInput(),
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
            initialValue: state.title.value,
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
            initialValue: state.description.value,
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

class _PriceInput extends StatelessWidget {
  double _parse(String price) {
    if (price.isEmpty) return 0;
    return double.parse(price);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FirstCreationFormBloc, FirstCreationFormState>(
      buildWhen: (previous, current) =>
          previous.price != current.price || previous.valute != current.valute,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: TextFormField(
            initialValue: state.price.value != null
                ? state.price.value.toStringAsFixed(0)
                : null,
            onChanged: (String price) => context
                .read<FirstCreationFormBloc>()
                .add(CreationPriceChanged(price: _parse(price))),
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey.shade200,
              labelText: 'Price',
              labelStyle: TextStyle(
                color: Colors.red.shade800,
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red.shade800, width: 2.0),
              ),
              suffixText: context
                  .read<FirstCreationFormBloc>()
                  .state
                  .valute
                  .value
                  .symbol,
            ),
          ),
        );
      },
    );
  }
}

class _ValuteInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FirstCreationFormBloc, FirstCreationFormState>(
      buildWhen: (previous, current) => previous.valute != current.valute,
      builder: (context, state) {
        return TextFormPickerField(
          value: context.read<FirstCreationFormBloc>().state.valute.value.name,
          labelText: 'Valute',
          padding: EdgeInsets.only(left: 8.0),
          picker: ValuteList(
            onTap: (valute) {
              context
                  .read<FirstCreationFormBloc>()
                  .add(CreationValuteChanged(valute: valute));
              Navigator.pop(context);
            },
          ),
        );
      },
    );
  }
}

class _MatriculationInput extends StatelessWidget {
  String _value(BuildContext context) {
    final value =
        context.read<FirstCreationFormBloc>().state.matriculation.value.year;
    if (value != null) return value.toString();
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FirstCreationFormBloc, FirstCreationFormState>(
      buildWhen: (previous, current) =>
          previous.matriculation != current.matriculation,
      builder: (context, state) {
        return TextFormPickerField(
          value: _value(context),
          labelText: 'Matriculation',
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          picker: AppYearPicker(
            onConfirm: (matriculation) {
              context.read<FirstCreationFormBloc>().add(
                  CreationMatriculationChanged(matriculation: matriculation));
            },
          ),
        );
      },
    );
  }
}

class _LocationInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FirstCreationFormBloc, FirstCreationFormState>(
      buildWhen: (previous, current) => previous.location != current.location,
      builder: (context, state) {
        return TextFormPickerField(
          value:
              context.read<FirstCreationFormBloc>().state.location.value.name,
          labelText: 'Location',
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          picker: LocationList(
            onTap: (location) {
              context
                  .read<FirstCreationFormBloc>()
                  .add(CreationLocationChanged(location: location));
              Navigator.pop(context);
            },
          ),
        );
      },
    );
  }
}
