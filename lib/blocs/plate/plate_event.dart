part of 'plate_bloc.dart';

abstract class PlateEvent extends Equatable {
  const PlateEvent();

  @override
  List<Object> get props => [];
}

class PlateFetched extends PlateEvent {}
