import 'package:emakina/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manufacturer_repository/manufacturer_repository.dart';

class ManufacturerList extends StatefulWidget {
  const ManufacturerList({
    @required this.onTap,
  });

  final Function(Manufacturer) onTap;

  @override
  _ManufacturerListState createState() => _ManufacturerListState();
}

class _ManufacturerListState extends State<ManufacturerList> {
  ManufacturerBloc _manufacturerBloc;

  @override
  void initState() {
    super.initState();
    _manufacturerBloc = context.read<ManufacturerBloc>()
      ..add(ManufacturerFetched());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ManufacturerBloc, ManufacturerState>(
      listener: (context, state) {},
      builder: (context, state) {
        switch (state.status) {
          case ManufacturerStatus.failure:
            return const Center(child: Text('failed to fetch door types'));
          case ManufacturerStatus.success:
            if (state.manufacturers.isEmpty) {
              return const Center(child: Text('no types'));
            }
            return Container(
              decoration: BoxDecoration(color: Colors.indigo[50]),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(state.manufacturers.length, (index) {
                  return _ManufacturerItem(
                    manufacturer: state.manufacturers[index],
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

class _ManufacturerItem extends StatelessWidget {
  final Manufacturer manufacturer;
  final Function(Manufacturer) onTap;

  const _ManufacturerItem({
    Key key,
    @required this.manufacturer,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(manufacturer),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(manufacturer.name, style: TextStyle(color: Colors.black87)),
          ],
        ),
      ),
    );
  }
}
