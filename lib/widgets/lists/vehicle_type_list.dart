import 'package:emakina/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicle_type_repository/vehicle_type_repository.dart';

class VehicleTypeList extends StatefulWidget {
  const VehicleTypeList({
    @required this.onTap,
  });

  final Function(VehicleType) onTap;

  @override
  _VehicleTypeListState createState() => _VehicleTypeListState();
}

class _VehicleTypeListState extends State<VehicleTypeList> {
  VehicleTypeBloc _vehicleTypeBloc;

  @override
  void initState() {
    super.initState();
    _vehicleTypeBloc = context.read<VehicleTypeBloc>()
      ..add(VehicleTypeFetched());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VehicleTypeBloc, VehicleTypeState>(
      listener: (context, state) {},
      builder: (context, state) {
        switch (state.status) {
          case VehicleTypeStatus.failure:
            return const Center(child: Text('failed to fetch door types'));
          case VehicleTypeStatus.success:
            if (state.types.isEmpty) {
              return const Center(child: Text('no types'));
            }
            return Material(
              child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) => _VehicleTypeItem(
                  type: state.types[index],
                  onTap: widget.onTap,
                ),
                separatorBuilder: (context, index) => Divider(),
                itemCount: state.types.length,
              ),
            );
          default:
            return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

class _VehicleTypeItem extends StatelessWidget {
  final VehicleType type;
  final Function(VehicleType) onTap;

  const _VehicleTypeItem({
    Key key,
    @required this.type,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(type.name, style: Theme.of(context).textTheme.headline6),
      onTap: () => onTap(type),
    );
  }
}
