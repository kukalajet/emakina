import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:emakina/blocs/blocs.dart';
import 'package:emakina/widgets/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ListingList extends StatefulWidget {
  @override
  _ListingListState createState() => _ListingListState();
}

class _ListingListState extends State<ListingList> {
  final _scrollController = ScrollController();
  final _scrollThreshold = 200.0;
  ListingBloc _postBloc;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _postBloc = BlocProvider.of<ListingBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListingBloc, ListingState>(
      // ignore: missing_return
      builder: (context, state) {
        if (state is ListingInitial) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is ListingFailure) {
          return Center(
            child: Text('failed to fetch posts'),
          );
        }
        if (state is ListingSuccess) {
          if (state.listings.isEmpty) {
            return Center(
              child: Text('no posts'),
            );
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
      _postBloc.add(ListingFetched());
    }
  }
}
