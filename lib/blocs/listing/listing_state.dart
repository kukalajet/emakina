part of 'listing_bloc.dart';

abstract class ListingState extends Equatable {
  const ListingState();

  @override
  List<Object> get props => [];
}

class ListingInitial extends ListingState {}

class ListingFailure extends ListingState {}

class ListingSuccess extends ListingState {
  const ListingSuccess({
    this.listings,
    this.hasReachedMax,
  });

  final List<Listing> listings;
  final bool hasReachedMax;

  ListingSuccess copyWith({
    List<Listing> listings,
    bool hasReachedmax,
  }) {
    return ListingSuccess(
      listings: listings ?? this.listings,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object> get props => [listings, hasReachedMax];

  @override
  String toString() =>
      'ListingSuccess { listings: ${listings.length}, hasReachedMax: $hasReachedMax }';
}
