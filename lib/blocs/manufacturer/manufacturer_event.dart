part of 'manufacturer_bloc.dart';

abstract class ManufacturerEvent extends Equatable {
  const ManufacturerEvent();

  @override
  List<Object> get props => [];
}

class ManufacturerFetched extends ManufacturerEvent {}
