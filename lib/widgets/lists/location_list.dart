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
            return Material(
              child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) => _LocationItem(
                  location: state.locations[index],
                  onTap: widget.onTap,
                ),
                separatorBuilder: (context, index) => Divider(),
                itemCount: state.locations.length,
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
    return ListTile(
      title: Text(location.name, style: Theme.of(context).textTheme.headline4),
      onTap: () => onTap(location),
    );
  }
}
