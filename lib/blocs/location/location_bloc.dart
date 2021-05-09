import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:location_repository/location_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  LocationBloc({
    @required LocationRepository locationRepository,
  })  : assert(locationRepository != null),
        _locationRepository = locationRepository,
        super(const LocationState());

  final LocationRepository _locationRepository;

  @override
  Stream<LocationState> mapEventToState(
    LocationEvent event,
  ) async* {
    if (event is LocationFetched) {
      yield await _mapLocationFetchedToState(state);
    }
  }

  Future<LocationState> _mapLocationFetchedToState(LocationState state) async {
    try {
      final locations = await _locationRepository.fetchLocations();
      return state.copyWith(
        status: LocationStatus.success,
        locations: locations,
      );
    } on Exception {
      return state.copyWith(status: LocationStatus.failure);
    }
  }
}
