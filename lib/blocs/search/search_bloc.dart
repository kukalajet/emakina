import 'package:bloc/bloc.dart';
import 'package:emakina/validations/validations.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:fuel_repository/fuel_repository.dart';
import 'package:listing_repository/listing_repository.dart';
import 'package:manufacturer_repository/manufacturer_repository.dart';
import 'package:meta/meta.dart';
import 'package:model_repository/model_repository.dart';
import 'package:transmission_repository/transmission_repository.dart';
import 'package:valute_repository/valute_repository.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc({
    @required ListingRepository listingRepository,
  })  : assert(listingRepository != null),
        _listingRepository = listingRepository,
        super(const SearchState());

  // TODO: Replace ListingRepository with a new SearchRepository.
  final ListingRepository _listingRepository;

  @override
  Stream<SearchState> mapEventToState(SearchEvent event) async* {
    if (event is SearchManufacturerChanged) {
      yield _mapManufacturerChangedToState(event, state);
    } else if (event is SearchFuelChanged) {
      yield _mapFuelChangedToState(event, state);
    } else if (event is SearchMileageChanged) {
      yield _mapMileageChangedToState(event, state);
    } else if (event is SearchModelChanged) {
      yield _mapModelChangedToState(event, state);
    } else if (event is SearchPriceChanged) {
      yield _mapPriceChangedToState(event, state);
    } else if (event is SearchMatriculationChanged) {
      yield _mapMatriculationChangedToState(event, state);
    } else if (event is SearchTransmissionChanged) {
      yield _mapTransmissionChangedToState(event, state);
    } else if (event is SearchedListingFetched) {
      yield await _mapSearchedListingFetchedToState(state);
    } else if (event is SearchStatusChangedToInitial) {
      yield _mapSearchStatusChangedToInitialToState(event, state);
    }
  }

  SearchState _mapSearchStatusChangedToInitialToState(
    SearchStatusChangedToInitial event,
    SearchState state,
  ) {
    final status = event.status;
    return state.copyWith(searchingStatus: status);
  }

  SearchState _mapManufacturerChangedToState(
    SearchManufacturerChanged event,
    SearchState state,
  ) {
    final manufacturer = SearchManufacturerField.dirty(event.manufacturer);
    return state.copyWith(
      manufacturer: manufacturer,
      status: Formz.validate([
        manufacturer,
        state.fuel,
        state.mileage,
        state.model,
        state.price,
        state.matriculation,
        state.transmission,
      ]),
    );
  }

  SearchState _mapFuelChangedToState(
    SearchFuelChanged event,
    SearchState state,
  ) {
    final fuel = SearchFuelField.dirty(event.fuel);
    return state.copyWith(
      fuel: fuel,
      status: Formz.validate([
        state.manufacturer,
        fuel,
        state.mileage,
        state.model,
        state.price,
        state.matriculation,
        state.transmission,
      ]),
    );
  }

  SearchState _mapMileageChangedToState(
    SearchMileageChanged event,
    SearchState state,
  ) {
    final values = [event.lowerLimit, event.upperLimit];
    final mileage = SearchMileageField.dirty(values);
    return state.copyWith(
      mileage: mileage,
      status: Formz.validate([
        state.manufacturer,
        state.fuel,
        mileage,
        state.model,
        state.price,
        state.matriculation,
        state.transmission,
      ]),
    );
  }

  SearchState _mapModelChangedToState(
    SearchModelChanged event,
    SearchState state,
  ) {
    final model = SearchModelField.dirty(event.model);
    return state.copyWith(
      model: model,
      status: Formz.validate([
        state.manufacturer,
        state.fuel,
        state.mileage,
        model,
        state.price,
        state.matriculation,
        state.transmission,
      ]),
    );
  }

  SearchState _mapPriceChangedToState(
    SearchPriceChanged event,
    SearchState state,
  ) {
    final values = [event.lowerLimit, event.upperLimit];
    final price = SearchPriceField.dirty(values);
    return state.copyWith(
      price: price,
      status: Formz.validate([
        state.manufacturer,
        state.fuel,
        state.mileage,
        state.model,
        price,
        state.matriculation,
        state.transmission,
      ]),
    );
  }

  SearchState _mapMatriculationChangedToState(
    SearchMatriculationChanged event,
    SearchState state,
  ) {
    final values = [event.lowerLimit, event.upperLimit];
    final matriculation = SearchMatriculationField.dirty(values);
    return state.copyWith(
      matriculation: matriculation,
      status: Formz.validate([
        state.manufacturer,
        state.fuel,
        state.mileage,
        state.model,
        state.price,
        matriculation,
        state.transmission,
      ]),
    );
  }

  SearchState _mapTransmissionChangedToState(
    SearchTransmissionChanged event,
    SearchState state,
  ) {
    final transmission = SearchTransmissionField.dirty(event.transmission);
    return state.copyWith(
      transmission: transmission,
      status: Formz.validate([
        state.manufacturer,
        state.fuel,
        state.mileage,
        state.model,
        state.price,
        state.matriculation,
        transmission,
      ]),
    );
  }

  Future<SearchState> _mapSearchedListingFetchedToState(
    SearchState state,
  ) async {
    if (state.hasReachedMax) return state;
    try {
      if (state.searchingStatus == SearchStatus.initial) {
        await Future.delayed(Duration(seconds: 1));
        final listings = await _listingRepository.fetchListings(0, 20);
        return state.copyWith(
          searchingStatus: SearchStatus.success,
          listings: listings,
          hasReachedMax: false,
          status: Formz.validate([
            state.manufacturer,
            state.fuel,
            state.mileage,
            state.model,
            state.price,
            state.matriculation,
            state.transmission,
          ]),
        );
      }

      await Future.delayed(Duration(seconds: 1));
      final listings =
          await _listingRepository.fetchListings(state.listings.length, 20);
      return listings.isEmpty
          ? state.copyWith(hasReachedMax: true)
          : state.copyWith(
              searchingStatus: SearchStatus.success,
              listings: List.of(state.listings)..addAll(listings),
              hasReachedMax: false,
            );
    } on Exception {
      return state.copyWith(searchingStatus: SearchStatus.failure);
    }
  }
}
