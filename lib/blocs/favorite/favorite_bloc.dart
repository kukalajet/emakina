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
    if (event is FavoriteFetched && !_hasReachedMax(state)) {
      yield await _mapFavoriteFetchedToState(state);
    } else if (event is FavoriteSaved) {
      yield await _mapFavoriteSavedToState(event, state);
    }
  }

  // ignore: missing_return
  Future<FavoriteState> _mapFavoriteFetchedToState(
    FavoriteState state,
  ) async {
    try {
      if (state is FavoriteInitial) {
        final favorites = await _favoriteRepository.getAll();
        return FavoriteSuccess(favorites: favorites, hasReachedMax: false);
      }
      if (state is FavoriteSuccess) {
        final favorites = await _favoriteRepository.getAll();
        return favorites.isEmpty
            ? state.copyWith(hasReachedmax: true)
            : FavoriteSuccess(
                favorites: state.favorites + favorites,
                hasReachedMax: false,
              );
      }
    } catch (_) {
      return FavoriteFailure();
    }
  }

  // ignore: missing_return
  Future<FavoriteState> _mapFavoriteSavedToState(
    FavoriteSaved event,
    FavoriteState state,
  ) async {
    try {
      final favorite = event.favorite;
      await _favoriteRepository.save(favorite);

      final favorites = await _favoriteRepository.getAll();
      if (state is FavoriteInitial) {
        return FavoriteSuccess(favorites: favorites, hasReachedMax: false);
      }
      if (state is FavoriteSuccess) {
        return favorites.isEmpty
            ? state.copyWith(hasReachedmax: true)
            : FavoriteSuccess(
                favorites: state.favorites, // + favorites,
                hasReachedMax: false,
              );
      }
    } catch (e) {
      print(e);
      return FavoriteFailure();
    }
  }

  bool _hasReachedMax(FavoriteState state) =>
      state is FavoriteSuccess && state.hasReachedMax;
}
