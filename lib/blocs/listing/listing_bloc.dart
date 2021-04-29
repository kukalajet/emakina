import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';
import 'package:listing_repository/listing_repository.dart';

part 'listing_event.dart';
part 'listing_state.dart';

class ListingBloc extends Bloc<ListingEvent, ListingState> {
  ListingBloc({
    @required ListingRepository listingRepository,
  })  : assert(listingRepository != null),
        _listingRepository = listingRepository,
        super(ListingInitial());

  final ListingRepository _listingRepository;

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
    final currentState = state;
    if (event is ListingFetched && !_hasReachedMax(currentState)) {
      try {
        if (currentState is ListingInitial) {
          final listings = await _listingRepository.fetchListings(0, 20);
          yield ListingSuccess(listings: listings, hasReachedMax: false);
          return;
        }
        if (currentState is ListingSuccess) {
          final listings = await _listingRepository.fetchListings(
              currentState.listings.length, 20);
          yield listings.isEmpty
              ? currentState.copyWith(hasReachedmax: true)
              : ListingSuccess(
                  listings: currentState.listings + listings,
                  hasReachedMax: false,
                );
        }
      } catch (_) {
        yield ListingFailure();
      }
    }
  }

  bool _hasReachedMax(ListingState state) =>
      state is ListingSuccess && state.hasReachedMax;
}
