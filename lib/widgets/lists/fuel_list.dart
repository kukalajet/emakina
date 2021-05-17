import 'package:emakina/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fuel_repository/fuel_repository.dart';

class FuelList extends StatefulWidget {
  const FuelList({
    @required this.onTap,
  });

  final Function(Fuel) onTap;

  @override
  _FuelListState createState() => _FuelListState();
}

class _FuelListState extends State<FuelList> {
  FuelBloc _fuelBloc;

  @override
  void initState() {
    super.initState();
    _fuelBloc = context.read<FuelBloc>()..add(FuelFetched());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FuelBloc, FuelState>(
      listener: (context, state) {},
      builder: (context, state) {
        switch (state.status) {
          case FuelStatus.failure:
            return const Center(child: Text('failed to fetch door types'));
          case FuelStatus.success:
            if (state.fuels.isEmpty) {
              return const Center(child: Text('no types'));
            }
            return Material(
              child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) => _FuelItem(
                  fuel: state.fuels[index],
                  onTap: widget.onTap,
                ),
                separatorBuilder: (context, index) => Divider(),
                itemCount: state.fuels.length,
              ),
            );
          default:
            return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

class _FuelItem extends StatelessWidget {
  final Fuel fuel;
  final Function(Fuel) onTap;

  const _FuelItem({
    Key key,
    @required this.fuel,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(fuel.type, style: Theme.of(context).textTheme.headline6),
      onTap: () => onTap(fuel),
    );
  }
}
