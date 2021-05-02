import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';
import 'package:listing_repository/listing_repository.dart';
import 'package:favorite_repository/favorite_repository.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc({
    @required FavoriteRepository favoriteRepository,
  })  : assert(favoriteRepository != null),
        _favoriteRepository = favoriteRepository,
        super(FavoriteInitial());

  final FavoriteRepository _favoriteRepository;

  @override
  Stream<Transition<FavoriteEvent, FavoriteState>> transformEvents(
    Stream<FavoriteEvent> events,
    TransitionFunction<FavoriteEvent, FavoriteState> transitionFn,
  ) {
    return super.transformEvents(
      events.debounceTime(const Duration(milliseconds: 500)),
      transitionFn,
    );
  }

  @override
  Stream<FavoriteState> mapEventToState(FavoriteEvent event) async* {
    if (event is FavoriteFetched) {
      yield await _mapFavoriteFetchedToState(state);
    } else if (event is FavoriteSaved) {
      yield await _mapFavoriteSavedToState(event, state);
    } else if (event is FavoriteRemoved) {
      yield await _mapFavoriteRemovedToState(event, state);
    }
  }

  // ignore: missing_return
  Future<FavoriteState> _mapFavoriteFetchedToState(
    FavoriteState state,
  ) async {
    try {
      if (state is FavoriteInitial) {
        final favorites = await _favoriteRepository.fetchFavorites();
        return FavoriteSuccess(favorites: favorites, hasReachedMax: true);
      }
    } catch (_) {
      return FavoriteFailure();
    }
  }

  // ignore: missing_return
  Future<FavoriteState> _mapFavoriteSavedToState(
    FavoriteSaved event,
    FavoriteSuccess state,
  ) async {
    try {
      final id = event.id;
      await _favoriteRepository.save(id);

      final favorite = await _favoriteRepository.fetchFavorite(id);
      return FavoriteSuccess(
        favorites: List.of(state.favorites)..add(favorite),
        hasReachedMax: true,
      );
    } catch (_) {
      return FavoriteFailure();
    }
  }

  Future<FavoriteState> _mapFavoriteRemovedToState(
    FavoriteRemoved event,
    FavoriteSuccess state,
  ) async {
    try {
      final id = event.id;
      await _favoriteRepository.remove(id);

      final List<Listing> updated = state.favorites.map((favorite) {
        return favorite.copyWith(isFavorite: false);
      }).toList();

      return FavoriteSuccess(favorites: updated, hasReachedMax: true);
    } catch (_) {
      return FavoriteFailure();
    }
  }
}
