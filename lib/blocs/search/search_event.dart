part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class SearchStatusChangedToInitial extends SearchEvent {
  const SearchStatusChangedToInitial();

  final SearchStatus status = SearchStatus.initial;

  @override
  List<Object> get props => [status];
}

class SearchManufacturerChanged extends SearchEvent {
  const SearchManufacturerChanged(this.manufacturer);

  final Manufacturer manufacturer;

  @override
  List<Object> get props => [manufacturer];
}

class SearchModelChanged extends SearchEvent {
  const SearchModelChanged(this.model);

  final Model model;

  @override
  List<Object> get props => [model];
}

class SearchFuelChanged extends SearchEvent {
  const SearchFuelChanged(this.fuel);

  final Fuel fuel;

  @override
  List<Object> get props => [fuel];
}

class SearchMileageChanged extends SearchEvent {
  const SearchMileageChanged(
    this.lowerLimit,
    this.upperLimit,
  );

  final double lowerLimit;
  final double upperLimit;

  @override
  List<Object> get props => [lowerLimit, upperLimit];
}

class SearchPriceChanged extends SearchEvent {
  const SearchPriceChanged(
    this.lowerLimit,
    this.upperLimit,
  );

  final Price lowerLimit;
  final Price upperLimit;

  @override
  List<Object> get props => [lowerLimit, upperLimit];
}

class SearchMatriculationChanged extends SearchEvent {
  const SearchMatriculationChanged(
    this.lowerLimit,
    this.upperLimit,
  );

  final Date lowerLimit;
  final Date upperLimit;

  @override
  List<Object> get props => [lowerLimit, upperLimit];
}

class SearchTransmissionChanged extends SearchEvent {
  const SearchTransmissionChanged(this.transmission);

  final Transmission transmission;

  @override
  List<Object> get props => [transmission];
}

class SearchedListingFetched extends SearchEvent {}
