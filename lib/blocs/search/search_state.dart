part of 'search_bloc.dart';

enum SearchStatus { notIntiated, initial, success, failure }

class SearchState extends Equatable {
  const SearchState({
    this.status = FormzStatus.pure,
    this.manufacturer = const SearchManufacturerField.pure(),
    this.model = const SearchModelField.pure(),
    this.matriculation = const SearchMatriculationField.pure(),
    this.price = const SearchPriceField.pure(),
    this.mileage = const SearchMileageField.pure(),
    this.transmission = const SearchTransmissionField.pure(),
    this.fuel = const SearchFuelField.pure(),
    this.searchingStatus = SearchStatus.notIntiated,
    this.listings = const <Listing>[],
    this.hasReachedMax = false,
  });

  final FormzStatus status;
  final SearchManufacturerField manufacturer;
  final SearchModelField model;
  final SearchMatriculationField matriculation;
  final SearchPriceField price;
  final SearchMileageField mileage;
  final SearchTransmissionField transmission;
  final SearchFuelField fuel;
  final SearchStatus searchingStatus;
  final List<Listing> listings;
  final bool hasReachedMax;

  SearchState copyWith({
    FormzStatus status,
    SearchManufacturerField manufacturer,
    SearchModelField model,
    SearchMatriculationField matriculation,
    SearchPriceField price,
    SearchMileageField mileage,
    SearchTransmissionField transmission,
    SearchFuelField fuel,
    SearchStatus searchingStatus,
    List<Listing> listings,
    bool hasReachedMax,
  }) {
    return SearchState(
      status: status ?? this.status,
      manufacturer: manufacturer ?? this.manufacturer,
      model: model ?? this.model,
      matriculation: matriculation ?? this.matriculation,
      price: price ?? this.price,
      mileage: mileage ?? this.mileage,
      transmission: transmission ?? this.transmission,
      fuel: fuel ?? this.fuel,
      searchingStatus: searchingStatus ?? this.searchingStatus,
      listings: listings ?? this.listings,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object> get props => [
        status,
        manufacturer,
        model,
        matriculation,
        price,
        mileage,
        transmission,
        fuel,
        searchingStatus,
        listings,
        hasReachedMax,
      ];
}
