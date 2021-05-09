part of 'vehicle_type_bloc.dart';

enum VehicleTypeStatus { initial, success, failure }

class VehicleTypeState extends Equatable {
  const VehicleTypeState({
    this.status = VehicleTypeStatus.initial,
    this.types = const <VehicleType>[],
  });

  final VehicleTypeStatus status;
  final List<VehicleType> types;

  VehicleTypeState copyWith({
    VehicleTypeStatus status,
    List<VehicleType> types,
  }) {
    return VehicleTypeState(
      status: status ?? this.status,
      types: types ?? this.types,
    );
  }

  @override
  List<Object> get props => [status, types];
}
