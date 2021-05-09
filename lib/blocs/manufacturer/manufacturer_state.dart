part of 'manufacturer_bloc.dart';

enum ManufacturerStatus { initial, success, failure }

class ManufacturerState extends Equatable {
  const ManufacturerState({
    this.status = ManufacturerStatus.initial,
    this.manufacturers = const <Manufacturer>[],
  });

  final ManufacturerStatus status;
  final List<Manufacturer> manufacturers;

  ManufacturerState copyWith({
    ManufacturerStatus status,
    List<Manufacturer> manufacturers,
  }) {
    return ManufacturerState(
      status: status ?? this.status,
      manufacturers: manufacturers ?? this.manufacturers,
    );
  }

  @override
  List<Object> get props => [status, manufacturers];
}
