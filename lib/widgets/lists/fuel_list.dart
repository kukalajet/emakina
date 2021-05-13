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
            return Container(
              decoration: BoxDecoration(color: Colors.indigo[50]),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(state.fuels.length, (index) {
                  return _FuelItem(
                    fuel: state.fuels[index],
                    onTap: widget.onTap,
                  );
                }),
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
    return GestureDetector(
      onTap: () => onTap(fuel),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(fuel.type, style: TextStyle(color: Colors.black87)),
          ],
        ),
        // child: ListTile(
        //   title: Text(fuel.name, style: TextStyle(color: Colors.black87)),
        // ),
      ),
    );
  }
}
