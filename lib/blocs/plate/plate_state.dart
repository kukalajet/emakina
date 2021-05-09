part of 'plate_bloc.dart';

enum PlateStatus { initial, success, failure }

class PlateState extends Equatable {
  const PlateState({
    this.status = PlateStatus.initial,
    this.plates = const <Plate>[],
  });

  final PlateStatus status;
  final List<Plate> plates;

  PlateState copyWith({
    PlateStatus status,
    List<Plate> plates,
  }) {
    return PlateState(
      status: status ?? this.status,
      plates: plates ?? this.plates,
    );
  }

  @override
  List<Object> get props => [status, plates];
}
