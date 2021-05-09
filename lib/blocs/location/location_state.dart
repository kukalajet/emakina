part of 'location_bloc.dart';

enum LocationStatus { initial, success, failure }

class LocationState extends Equatable {
  const LocationState({
    this.status = LocationStatus.initial,
    this.locations = const <Location>[],
  });

  final LocationStatus status;
  final List<Location> locations;

  LocationState copyWith({
    LocationStatus status,
    List<Location> locations,
  }) {
    return LocationState(
      status: status ?? this.status,
      locations: locations ?? this.locations,
    );
  }

  @override
  List<Object> get props => [status, locations];
}
