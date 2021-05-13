part of 'fuel_bloc.dart';

enum FuelStatus { initial, success, failure }

class FuelState extends Equatable {
  const FuelState({
    this.status = FuelStatus.initial,
    this.fuels = const <Fuel>[],
  });

  final FuelStatus status;
  final List<Fuel> fuels;

  FuelState copyWith({
    FuelStatus status,
    List<Fuel> fuels,
  }) {
    return FuelState(
      status: status ?? this.status,
      fuels: fuels ?? this.fuels,
    );
  }

  @override
  List<Object> get props => [status, fuels];
}
