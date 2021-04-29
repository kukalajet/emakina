import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:emakina/blocs/blocs.dart';
import 'package:emakina/widgets/widgets.dart';

class FavoriteList extends StatefulWidget {
  @override
  _FavoriteListState createState() => _FavoriteListState();
}

class _FavoriteListState extends State<FavoriteList> {
  final _scrollController = ScrollController();
  final _scrollThreshold = 200.0;
  FavoriteBloc _postBloc;

  @override
  void initState() {
    super.initState();

    /// Disabled _onScroll callback since it should be also managed by the
    /// repository. For the moment, we'll fetch all the favorites and see if
    /// it is fast enough to parse and populate.
    // _scrollController.addListener(_onScroll);
    _postBloc = BlocProvider.of<FavoriteBloc>(context)..add(FavoriteFetched());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteBloc, FavoriteState>(
      // ignore: missing_return
      builder: (context, state) {
        if (state is FavoriteInitial) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is FavoriteFailure) {
          return Center(
            child: Text('failed to fetch posts'),
          );
        }
        if (state is FavoriteSuccess) {
          if (state.favorites.isEmpty) {
            return Center(
              child: Text('no posts'),
            );
          }
          return GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 2.0,
              mainAxisSpacing: 2.0,
              childAspectRatio: 4 / 5,
            ),
            itemBuilder: (BuildContext context, int index) {
              return index >= state.favorites.length
                  ? BottomLoader()
                  : ListingTileAlt(listing: state.favorites[index]);
            },
            itemCount: state.hasReachedMax
                ? state.favorites.length
                : state.favorites.length + 1,
          );
        }
      },
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= _scrollThreshold) {
      _postBloc.add(FavoriteFetched());
    }
  }
}
