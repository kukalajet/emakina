part of 'vehicle_type_bloc.dart';

abstract class VehicleTypeEvent extends Equatable {
  const VehicleTypeEvent();

  @override
  List<Object> get props => [];
}

class VehicleTypeFetched extends VehicleTypeEvent {}
