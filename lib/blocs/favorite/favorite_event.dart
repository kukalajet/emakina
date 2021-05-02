part of 'favorite_bloc.dart';

abstract class FavoriteEvent extends Equatable {
  const FavoriteEvent();

  @override
  List<Object> get props => [];
}

class FavoriteFetched extends FavoriteEvent {}

class FavoriteSaved extends FavoriteEvent {
  const FavoriteSaved({
    @required this.id,
  });

  final int id;

  @override
  List<Object> get props => [id];

  @override
  String toString() => 'FavoriteSaved { id: $id }';
}

class FavoriteRemoved extends FavoriteEvent {
  const FavoriteRemoved({
    @required this.id,
  });

  final int id;

  @override
  List<Object> get props => [id];

  @override
  String toString() => 'FavoriteRemoved { id: $id }';
}
