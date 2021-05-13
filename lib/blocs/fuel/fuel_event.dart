part of 'fuel_bloc.dart';

abstract class FuelEvent extends Equatable {
  const FuelEvent();

  @override
  List<Object> get props => [];
}

class FuelFetched extends FuelEvent {}
