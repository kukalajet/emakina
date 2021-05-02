part of 'listing_bloc.dart';

abstract class ListingEvent extends Equatable {
  const ListingEvent();

  @override
  List<Object> get props => [];
}

class ListingFetched extends ListingEvent {}

class ListingFavoriteSaved extends ListingEvent {
  const ListingFavoriteSaved({@required this.id});

  final int id;

  @override
  List<Object> get props => [id];

  @override
  String toString() => 'ListingFavoriteSaved { id: $id }';
}

class ListingFavoriteRemoved extends ListingEvent {
  const ListingFavoriteRemoved({@required this.id});

  final int id;

  @override
  List<Object> get props => [id];

  @override
  String toString() => 'ListingFavoriteRemoved { id: $id }';
}
