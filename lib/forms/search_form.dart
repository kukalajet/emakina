import 'package:emakina/blocs/blocs.dart';
import 'package:emakina/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listing_repository/listing_repository.dart';
import 'package:valute_repository/valute_repository.dart';

class SearchForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<SearchBloc, SearchState>(
      listener: (context, state) {},
      child: Align(
        alignment: const Alignment(0, -1 / 3),
        child: SingleChildScrollView(
          primary: true,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Padding(padding: EdgeInsets.all(8.0)),
              _ManufacturerInput(),
              const Padding(padding: EdgeInsets.all(8.0)),
              _ModelInput(),
              const Padding(padding: EdgeInsets.all(8.0)),
              _PriceInput(),
              const Padding(padding: EdgeInsets.all(8.0)),
              _FuelInput(),
              const Padding(padding: EdgeInsets.all(8.0)),
              _MileageInput(),
              const Padding(padding: EdgeInsets.all(8.0)),
              _MatriculationInput(),
              const Padding(padding: EdgeInsets.all(8.0)),
              _TransmissionInput(),
            ],
          ),
        ),
      ),
    );
  }
}

class _ManufacturerInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      buildWhen: (previous, current) =>
          previous.manufacturer != current.manufacturer,
      builder: (context, state) {
        return TextFormPickerField(
          value: context.read<SearchBloc>().state.manufacturer.value.name,
          labelText: 'Manufacturer',
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          icon: const IconData(0x1F698, fontFamily: 'MaterialIcons'),
          picker: ManufacturerList(
            onTap: (manufacturer) {
              context
                  .read<SearchBloc>()
                  .add(SearchManufacturerChanged(manufacturer));
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
    return BlocBuilder<SearchBloc, SearchState>(
      buildWhen: (previous, current) {
        if (previous.manufacturer != current.manufacturer) return true;
        if (previous.model != current.model) return true;
        return false;
      },
      builder: (context, state) {
        final int manufacturerId = state.manufacturer.value.id;

        return TextFormPickerField(
          value: context.read<SearchBloc>().state.model.value.name,
          labelText: 'Model',
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          icon: const IconData(0x1F699, fontFamily: 'MaterialIcons'),
          picker: manufacturerId != null
              ? ModelList(
                  manufaturerId: manufacturerId,
                  onTap: (model) {
                    context.read<SearchBloc>().add(SearchModelChanged(model));
                    Navigator.pop(context);
                  },
                )
              : Center(child: Text('You must choose a manufacturer first.')),
        );
      },
    );
  }
}

class _PriceInput extends StatelessWidget {
  String _getValue(SearchState state) {
    if (state.price.value.isEmpty) return null;

    final lowerValueValute = state.price.value[0].valute.symbol;
    final upperValueValute = state.price.value[1].valute.symbol;
    final lowerValue = state.price.value[0].value.toInt();
    final upperValue = state.price.value[1].value.toInt();

    if (lowerValue == 0 && upperValue == 50000) return null;
    if (lowerValue == 0) return 'Up to $upperValue $upperValueValute';
    if (upperValue == 50000) return 'Up to $lowerValue $lowerValueValute';
    return 'From $lowerValue $lowerValueValute to $upperValue $upperValueValute';
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      buildWhen: (previous, current) => true,
      builder: (context, state) {
        return TextFormPickerField(
          value: _getValue(state),
          labelText: 'Price Filter',
          icon: const IconData(0x1F4B0, fontFamily: 'MaterialIcons'),
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          picker: SearchSlider(
            lowerValue: state.price.value.isNotEmpty
                ? state.price.value[0].value.toInt()
                : null,
            upperValue: state.price.value.isNotEmpty
                ? state.price.value[1].value.toInt()
                : null,
            lowerPossibleValue: 0,
            upperPossibleValue: 15000,
            description: 'Choose price range:',
            divider: 1000,
            suffix: Valute.euro().symbol,
            onSubmit: (lowerLimit, upperLimit) {
              final valute = Valute.euro();
              final lowerLimitPrice = Price(value: lowerLimit, valute: valute);
              final upperLimitPrice = Price(value: upperLimit, valute: valute);

              context
                  .read<SearchBloc>()
                  .add(SearchPriceChanged(lowerLimitPrice, upperLimitPrice));
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
    return BlocBuilder<SearchBloc, SearchState>(
      buildWhen: (previous, current) => previous.fuel != current.fuel,
      builder: (context, state) {
        return TextFormPickerField(
          value: context.read<SearchBloc>().state.fuel.value.type,
          labelText: 'Fuel',
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          icon: const IconData(0x26FD, fontFamily: 'MaterialIcons'),
          picker: FuelList(
            onTap: (fuel) {
              context.read<SearchBloc>().add(SearchFuelChanged(fuel));
              Navigator.pop(context);
            },
          ),
        );
      },
    );
  }
}

class _MileageInput extends StatelessWidget {
  String _getValue(SearchState state) {
    if (state.mileage.value.isEmpty) return null;
    final lowerValue = state.mileage.value[0].toInt();
    final upperValue = state.mileage.value[1].toInt();

    if (lowerValue == 0 && upperValue == 500000) return null;
    if (lowerValue == 0) return 'Up to $upperValue KM';
    if (upperValue == 250000) return 'From $lowerValue KM';
    return 'From $lowerValue KM to $upperValue KM';
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      buildWhen: (previous, current) {
        if (previous.mileage.value.isEmpty || current.mileage.value.isEmpty)
          return false;
        if (previous.mileage.value[0] != current.mileage.value[0]) return true;
        if (previous.mileage.value[1] != current.mileage.value[1]) return true;
        return false;
      },
      builder: (context, state) {
        return TextFormPickerField(
          value: _getValue(state),
          labelText: 'Mileage Filter',
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          icon: const IconData(0x1F3CE, fontFamily: 'MaterialIcons'),
          picker: SearchSlider(
            lowerValue: state.mileage.value.isNotEmpty
                ? state.mileage.value[0].toInt()
                : null,
            upperValue: state.mileage.value.isNotEmpty
                ? state.mileage.value[1].toInt()
                : null,
            lowerPossibleValue: 0,
            upperPossibleValue: 250000,
            description: 'Choose mileage range:',
            onSubmit: (lowerLimit, upperLimit) => context
                .read<SearchBloc>()
                .add(SearchMileageChanged(lowerLimit, upperLimit)),
            suffix: 'KM',
            divider: 10000.0,
          ),
        );
      },
    );
  }
}

class _MatriculationInput extends StatelessWidget {
  String _getValue(SearchState state) {
    if (state.matriculation.value.isEmpty) return null;
    final lowerValue = state.matriculation.value[0];
    final upperValue = state.matriculation.value[1];

    if (lowerValue.year == 1950 && upperValue.year == 2021) return null;
    if (lowerValue.year == 1950) return 'Up to ${upperValue.year}';
    if (upperValue.year == 2021) return 'From ${lowerValue.year}';
    return 'From ${lowerValue.year} to ${upperValue.year}';
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      buildWhen: (previous, current) => true,
      builder: (context, state) {
        return TextFormPickerField(
          value: _getValue(state),
          labelText: 'Matriculation Filter',
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          icon: const IconData(0x1F4C5, fontFamily: 'MaterialIcons'),
          picker: SearchSlider(
            lowerValue: state.matriculation.value.isNotEmpty
                ? state.matriculation.value[0].year
                : null,
            upperValue: state.matriculation.value.isNotEmpty
                ? state.matriculation.value[1].year
                : null,
            lowerPossibleValue: 1950,
            upperPossibleValue: 2021,
            description: 'Choose matriculation year change:',
            onSubmit: (lowerLimit, upperLimit) {
              final lowerLimitDate =
                  Date(day: 1, month: 1, year: lowerLimit.toInt());
              final upperLimitDate =
                  Date(day: 1, month: 1, year: upperLimit.toInt());
              context.read<SearchBloc>().add(
                  SearchMatriculationChanged(lowerLimitDate, upperLimitDate));
            },
            divider: 1,
          ),
        );
      },
    );
  }
}

class _TransmissionInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      buildWhen: (previous, current) =>
          previous.transmission != current.transmission,
      builder: (context, state) {
        return TextFormPickerField(
          value: context.read<SearchBloc>().state.transmission.value.type,
          labelText: 'Transmission',
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          icon: const IconData(0x2699, fontFamily: 'MaterialIcons'),
          picker: TransmissionList(
            onTap: (transmission) {
              context
                  .read<SearchBloc>()
                  .add(SearchTransmissionChanged(transmission));
              Navigator.pop(context);
            },
          ),
        );
      },
    );
  }
}
