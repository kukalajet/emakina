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
            return Container(
              decoration: BoxDecoration(color: Colors.indigo[50]),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(state.types.length, (index) {
                  return _VehicleTypeItem(
                    vehicleType: state.types[index],
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

class _VehicleTypeItem extends StatelessWidget {
  final VehicleType vehicleType;
  final Function(VehicleType) onTap;

  const _VehicleTypeItem({
    Key key,
    @required this.vehicleType,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(vehicleType),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(vehicleType.name, style: TextStyle(color: Colors.black87)),
          ],
        ),
      ),
    );
  }
}
