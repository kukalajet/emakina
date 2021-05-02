import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:favorite_repository/favorite_repository.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';
import 'package:listing_repository/listing_repository.dart';

part 'listing_event.dart';
part 'listing_state.dart';

class ListingBloc extends Bloc<ListingEvent, ListingState> {
  ListingBloc({
    @required ListingRepository listingRepository,
    @required FavoriteRepository favoriteRepository,
  })  : assert(listingRepository != null),
        assert(favoriteRepository != null),
        _listingRepository = listingRepository,
        _favoriteRepository = favoriteRepository,
        super(ListingInitial());

  final ListingRepository _listingRepository;
  final FavoriteRepository _favoriteRepository;

  @override
  Stream<Transition<ListingEvent, ListingState>> transformEvents(
    Stream<ListingEvent> events,
    TransitionFunction<ListingEvent, ListingState> transitionFn,
  ) {
    return super.transformEvents(
      events.debounceTime(const Duration(milliseconds: 500)),
      transitionFn,
    );
  }

  @override
  Stream<ListingState> mapEventToState(ListingEvent event) async* {
    if (event is ListingFetched && !_hasReachedMax(state)) {
      yield await _mapListingFetchedToState(state);
    } else if (event is ListingFavoriteSaved) {
      yield await _mapListingFavoriteSavedToState(event, state);
    } else if (event is ListingFavoriteRemoved) {
      yield await _mapListingFavoriteRemovedToState(event, state);
    }
  }

  // ignore: missing_return
  Future<ListingState> _mapListingFetchedToState(
    ListingState state,
  ) async {
    try {
      final favoriteIds = await _fetchFavoriteIds();
      if (state is ListingInitial) {
        final listings = await _listingRepository.fetchListings(0, 20);
        final List<Listing> updated = listings.map((listing) {
          final id = listing.id;
          if (favoriteIds.contains(id)) {
            return listing.copyWith(isFavorite: true);
          }

          return listing;
        }).toList();

        return ListingSuccess(listings: updated, hasReachedMax: false);
      }
      if (state is ListingSuccess) {
        final listings =
            await _listingRepository.fetchListings(state.listings.length, 20);
        final List<Listing> updated = listings.map((listing) {
          final id = listing.id;
          if (favoriteIds.contains(id)) {
            return listing.copyWith(isFavorite: true);
          }

          return listing;
        }).toList();

        return listings.isEmpty
            ? state.copyWith(hasReachedmax: true)
            : ListingSuccess(
                listings: state.listings + updated,
                hasReachedMax: false,
              );
      }
    } catch (_) {
      return ListingFailure();
    }
  }

  // ignore: missing_return
  Future<ListingState> _mapListingFavoriteSavedToState(
    ListingFavoriteSaved event,
    ListingSuccess state,
  ) async {
    try {
      final id = event.id;
      await _favoriteRepository.save(id);

      final favoriteIds = await _fetchFavoriteIds();
      final List<Listing> updated = state.listings.map((listing) {
        final id = listing.id;
        if (favoriteIds.contains(id)) {
          return listing.copyWith(isFavorite: true);
        }

        return listing;
      }).toList();

      return updated.isEmpty
          ? state.copyWith(hasReachedmax: true)
          : ListingSuccess(listings: updated, hasReachedMax: false);
    } catch (_) {
      return ListingFailure();
    }
  }

  Future<ListingState> _mapListingFavoriteRemovedToState(
    ListingFavoriteRemoved event,
    ListingSuccess state,
  ) async {
    try {
      final id = event.id;
      await _favoriteRepository.remove(id);

      final List<Listing> updated = state.listings.map((listing) {
        if (listing.id == id) {
          return listing.copyWith(isFavorite: false);
        }

        return listing;
      }).toList();

      return updated.isEmpty
          ? state.copyWith(hasReachedmax: true)
          : ListingSuccess(listings: updated, hasReachedMax: false);
    } catch (_) {
      return ListingFailure();
    }
  }

  bool _hasReachedMax(ListingState state) =>
      state is ListingSuccess && state.hasReachedMax;

  Future<List<dynamic>> _fetchFavoriteIds() async {
    return await _favoriteRepository.getFavoriteIds();
  }
}
