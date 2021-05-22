import 'package:emakina/blocs/blocs.dart';
import 'package:emakina/forms/forms.dart';
import 'package:emakina/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:listing_repository/listing_repository.dart';

class SearchScreen extends StatelessWidget {
  Text _buildTitle() {
    return Text(
      'Search',
      style: GoogleFonts.lato(
        color: Colors.red[900],
        fontSize: 25.0,
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.w900,
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      bottomOpacity: 0.0,
      elevation: 0.0,
      title: _buildTitle(),
      iconTheme: IconThemeData(color: Colors.red.shade900),
    );
  }

  Widget _buildBottomSheet(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 64.0,
        color: Colors.red.shade800,
        child: SizedBox.expand(
          child: TextButton(
            onPressed: () {
              // context.read<SearchBloc>().add(SearchedListingFetched());
              context.read<SearchBloc>().add(SearchStatusChangedToInitial());
              context.read<SearchBloc>().add(SearchedListingFetched());
            },
            style: ButtonStyle(
              padding: MaterialStateProperty.all(
                  EdgeInsets.symmetric(horizontal: 8.0)),
              backgroundColor: MaterialStateProperty.all(Colors.red.shade900),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Icon(
                    Icons.search_sharp,
                    color: Colors.white,
                    size: 36.0,
                  ),
                ),
                Text(
                  'SEARCH',
                  style: GoogleFonts.lato(
                    fontSize: 24.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Persisten bottom sheet doesn't change when wrapped in SafeArea.
    // https://github.com/flutter/flutter/issues/696768
    // TODO: When this gets fixed, change the tree.
    return ColoredSafeArea(
      child: BlocProvider(
        create: (_) => SearchBloc(
          listingRepository: RepositoryProvider.of<ListingRepository>(context),
        ),
        child: BlocConsumer<SearchBloc, SearchState>(
          listener: (context, state) => null,
          buildWhen: (previous, current) => previous != current,
          builder: (context, state) {
            final _isSearchListInitiated =
                state.searchingStatus != SearchStatus.notIntiated;

            return Scaffold(
              appBar: _buildAppBar(),
              body: AnimatedSwitcher(
                duration: Duration(milliseconds: 500),
                child: _isSearchListInitiated ? SearchList() : SearchForm(),
              ),
              bottomSheet: AnimatedSwitcher(
                duration: Duration(milliseconds: 500),
                child: !_isSearchListInitiated
                    ? _buildBottomSheet(context)
                    : SizedBox(),
              ),
            );
          },
        ),
      ),
    );
  }
}
