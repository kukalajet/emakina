import 'package:emakina/blocs/blocs.dart';
import 'package:emakina/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class SearchList extends StatefulWidget {
  @override
  _SearchListState createState() => _SearchListState();
}

class _SearchListState extends State<SearchList> {
  final _scrollController = ScrollController(initialScrollOffset: 1.0);
  SearchBloc _searchBloc;

  void _onScroll() {
    if (_isBottom) _searchBloc.add(SearchedListingFetched());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _searchBloc = context.read<SearchBloc>();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchBloc, SearchState>(
      listener: (context, state) {
        if (!state.hasReachedMax && _isBottom) {
          _searchBloc.add(SearchedListingFetched());
        }
      },
      builder: (context, state) {
        switch (state.searchingStatus) {
          case SearchStatus.failure:
            return const Center(child: Text('failed to fetch listings'));
          case SearchStatus.success:
            if (state.listings.isEmpty) {
              return const Center(child: Text('no results'));
            }
            return StaggeredGridView.countBuilder(
              crossAxisCount: 2,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              controller: _scrollController,
              itemCount: state.hasReachedMax
                  ? state.listings.length
                  : state.listings.length + 1,
              itemBuilder: (BuildContext context, int index) {
                return index >= state.listings.length
                    ? BottomLoader()
                    : ListingTileAlt(
                        listing: state.listings[index],
                        index: index,
                      );
              },
              staggeredTileBuilder: (int index) {
                double mainAxisCellCount = 1.05;
                if (index % 2 == 0) mainAxisCellCount = 1.10;
                if (index % 3 == 0) mainAxisCellCount = 1.15;
                if (index % 5 == 0) mainAxisCellCount = 1.20;
                return StaggeredTile.count(1, mainAxisCellCount);
              },
            );
          default:
            return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
