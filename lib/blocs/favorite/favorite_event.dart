part of 'favorite_bloc.dart';

abstract class FavoriteEvent extends Equatable {
  const FavoriteEvent();

  @override
  List<Object> get props => [];
}

class FavoriteFetched extends FavoriteEvent {}

class FavoriteSaved extends FavoriteEvent {
  const FavoriteSaved({
    @required this.favorite,
  });

  final Listing favorite;

  @override
  List<Object> get props => [favorite];

  @override
  String toString() => 'FavoriteSaved { favorite: $favorite }';
}
