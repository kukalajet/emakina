import 'package:emakina/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location_repository/location_repository.dart';

class LocationList extends StatefulWidget {
  const LocationList({
    @required this.onTap,
  });

  final Function(Location) onTap;

  @override
  _LocationListState createState() => _LocationListState();
}

class _LocationListState extends State<LocationList> {
  LocationBloc _locationBloc;

  @override
  void initState() {
    super.initState();
    _locationBloc = context.read<LocationBloc>()..add(LocationFetched());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LocationBloc, LocationState>(
      listener: (context, state) {},
      builder: (context, state) {
        switch (state.status) {
          case LocationStatus.failure:
            return const Center(child: Text('failed to fetch door types'));
          case LocationStatus.success:
            if (state.locations.isEmpty) {
              return const Center(child: Text('no types'));
            }
            return Container(
              decoration: BoxDecoration(color: Colors.indigo[50]),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(state.locations.length, (index) {
                  return _LocationItem(
                    location: state.locations[index],
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

class _LocationItem extends StatelessWidget {
  final Location location;
  final Function(Location) onTap;

  const _LocationItem({
    Key key,
    @required this.location,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(location),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(location.name, style: TextStyle(color: Colors.black87)),
          ],
        ),
        // child: ListTile(
        //   title: Text(location.name, style: TextStyle(color: Colors.black87)),
        // ),
      ),
    );
  }
}
