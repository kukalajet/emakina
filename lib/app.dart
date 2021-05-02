import 'package:emakina/screens/home_stack.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:emakina/blocs/blocs.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:listing_repository/listing_repository.dart';
import 'package:favorite_repository/favorite_repository.dart';

class App extends StatelessWidget {
  const App({
    Key key,
    @required this.listingRepository,
    @required this.favoriteRepository,
  }) : assert(listingRepository != null);

  final ListingRepository listingRepository;
  final FavoriteRepository favoriteRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<ListingRepository>(
          create: (_) => listingRepository,
        ),
        RepositoryProvider<FavoriteRepository>(
          create: (_) => favoriteRepository,
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<ListingBloc>(
            create: (_) => ListingBloc(
              listingRepository: listingRepository,
              favoriteRepository: favoriteRepository,
            )..add(ListingFetched()),
          ),
          BlocProvider<FavoriteBloc>(
            create: (_) => FavoriteBloc(
              favoriteRepository: favoriteRepository,
            )..add(FavoriteFetched()),
          ),
          BlocProvider<TabBloc>(
            create: (_) => TabBloc(),
          ),
        ],
        child: AppView(),
      ),
    );
  }
}

class AppView extends StatefulWidget {
  @override
  _AppViewState createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: _buildTextTheme(context),
      ),
      home: HomeStack(),
    );
  }
}

TextTheme _buildTextTheme(BuildContext context) {
  return TextTheme(
    headline4: GoogleFonts.lato(
      color: Colors.black87,
      textStyle: Theme.of(context).textTheme.headline4,
      fontWeight: FontWeight.w700,
      letterSpacing: 1.25,
    ),
    headline5: GoogleFonts.roboto(
      textStyle: Theme.of(context).textTheme.headline5,
      fontWeight: FontWeight.w600,
    ),
    headline6: GoogleFonts.roboto(
      textStyle: Theme.of(context).textTheme.headline6,
      fontWeight: FontWeight.w600,
      color: Colors.black87,
    ),
    subtitle1: GoogleFonts.roboto(
      color: Colors.black54,
      textStyle: Theme.of(context).textTheme.subtitle1,
      fontWeight: FontWeight.w600,
    ),
    subtitle2: GoogleFonts.roboto(
      color: Colors.black54,
      textStyle: Theme.of(context).textTheme.subtitle2,
      fontWeight: FontWeight.w600,
    ),
  );
}
