import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:emakina/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:listing_repository/listing_repository.dart';

class ListingTileAlt extends StatelessWidget {
  const ListingTileAlt({@required this.listing});

  final Listing listing;

  Widget _buildPreview(BuildContext context) {
    return Stack(
      children: [
        _buildPreviewImage(),
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: MaterialButton(
              onPressed: () {
                if (listing.isFavorite) {
                  context
                      .read<FavoriteBloc>()
                      .add(FavoriteRemoved(id: listing.id));
                  context
                      .read<ListingBloc>()
                      .add(ListingFavoriteRemoved(id: listing.id));
                } else {
                  context
                      .read<FavoriteBloc>()
                      .add(FavoriteSaved(id: listing.id));
                  context
                      .read<ListingBloc>()
                      .add(ListingFavoriteSaved(id: listing.id));
                }
              },
              color: Colors.white,
              child: Icon(
                Icons.bookmark,
                color:
                    listing.isFavorite ? Colors.red.shade900 : Colors.black38,
                size: 20.0,
              ),
              padding: const EdgeInsets.all(8.0),
              shape: const CircleBorder(),
              minWidth: 0.0,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildPreviewImage() {
    return CachedNetworkImage(
      imageUrl: listing.urls[0],
      imageBuilder: (context, imageProvider) => Container(
        width: MediaQuery.of(context).size.width / 2 - 4,
        height: MediaQuery.of(context).size.width / 2 - 8,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      placeholder: (context, url) => Container(
        width: MediaQuery.of(context).size.width / 2 - 4,
        height: MediaQuery.of(context).size.width / 2 - 8,
        child: Center(child: CircularProgressIndicator()),
      ),
      errorWidget: (context, url, error) => Container(
        width: MediaQuery.of(context).size.width / 2 - 4,
        height: MediaQuery.of(context).size.width / 2 - 8,
        child: Center(child: Icon(Icons.error)),
      ),
    );
  }

  Widget _buildData(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitle(context),
          _buildPrice(context),
        ],
      ),
    );
  }

  Widget _buildPrice(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 4.0, right: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${listing.price.value} ${listing.price.valute.symbol}',
            style: GoogleFonts.lato(
              fontWeight: FontWeight.w600,
              color: Colors.red[900],
              fontSize: 15.0,
            ),
          ),
          Text(
            '${listing.mileage}KM · ${listing.year}',
            style: GoogleFonts.lato(
              fontWeight: FontWeight.w500,
              color: Colors.black54,
              fontSize: 14.0,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 4.0, top: 4.0),
      child: Text(
        'MERCEDES BENZ CLK320',
        style: GoogleFonts.lato(
          fontWeight: FontWeight.w700,
          color: Colors.black87,
          fontSize: 16.0,
          wordSpacing: -0.5,
          letterSpacing: -0.25,
          fontStyle: FontStyle.italic,
        ),
        overflow: TextOverflow.fade,
        maxLines: 1,
        softWrap: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildPreview(context),
        _buildData(context),
      ],
    );
  }
}
