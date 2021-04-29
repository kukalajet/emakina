part of 'favorite_bloc.dart';

abstract class FavoriteState extends Equatable {
  const FavoriteState();

  @override
  List<Object> get props => [];
}

class FavoriteInitial extends FavoriteState {}

class FavoriteFailure extends FavoriteState {}

class FavoriteSuccess extends FavoriteState {
  const FavoriteSuccess({
    this.favorites,
    this.hasReachedMax,
  });

  final List<Listing> favorites;
  final bool hasReachedMax;

  FavoriteSuccess copyWith({
    List<Listing> favorites,
    bool hasReachedmax,
  }) {
    return FavoriteSuccess(
      favorites: favorites ?? this.favorites,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object> get props => [favorites, hasReachedMax];

  @override
  String toString() =>
      'ListingSuccess { favorites: ${favorites.length}, hasReachedMax: $hasReachedMax }';
}
