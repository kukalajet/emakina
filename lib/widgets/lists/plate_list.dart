import 'package:emakina/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plate_repository/plate_repository.dart';

class PlateList extends StatefulWidget {
  const PlateList({
    @required this.onTap,
  });

  final Function(Plate) onTap;

  @override
  _PlateListState createState() => _PlateListState();
}

class _PlateListState extends State<PlateList> {
  PlateBloc _plateBloc;

  @override
  void initState() {
    super.initState();
    _plateBloc = context.read<PlateBloc>()..add(PlateFetched());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PlateBloc, PlateState>(
      listener: (context, state) {},
      builder: (context, state) {
        switch (state.status) {
          case PlateStatus.failure:
            return const Center(child: Text('failed to fetch door types'));
          case PlateStatus.success:
            if (state.plates.isEmpty) {
              return const Center(child: Text('no types'));
            }
            return Material(
              child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) => _PlateItem(
                  plate: state.plates[index],
                  onTap: widget.onTap,
                ),
                separatorBuilder: (context, index) => Divider(),
                itemCount: state.plates.length,
              ),
            );
          default:
            return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

class _PlateItem extends StatelessWidget {
  final Plate plate;
  final Function(Plate) onTap;

  const _PlateItem({
    Key key,
    @required this.plate,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(plate.name, style: Theme.of(context).textTheme.headline6),
      onTap: () => onTap(plate),
    );
  }
}
