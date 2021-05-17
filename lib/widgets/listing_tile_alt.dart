import 'package:emakina/screens/screens.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:emakina/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:listing_repository/listing_repository.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class ListingTileAlt extends StatelessWidget {
  const ListingTileAlt({
    @required this.listing,
    @required this.index,
  });

  final Listing listing;
  final int index;

  Widget _buildPreview(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          _buildPreviewImage(),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(2.0),
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
                  size: 16.0,
                ),
                padding: const EdgeInsets.all(8.0),
                shape: const CircleBorder(),
                minWidth: 0.0,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildPreviewImage() {
    return CachedNetworkImage(
      imageUrl: listing.images[0],
      imageBuilder: (context, imageProvider) => Center(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(index.isOdd ? 8.0 : 0.0),
              topRight: Radius.circular(index.isEven ? 8.0 : 0.0),
            ),
          ),
        ),
      ),
      placeholder: (context, url) => Container(
        child: Center(child: CircularProgressIndicator()),
      ),
      errorWidget: (context, url, error) => Container(
        child: Center(child: Icon(Icons.error)),
      ),
    );
  }

  Widget _buildData(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
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
      padding: EdgeInsets.only(left: 4.0, right: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${listing.price.value.toStringAsFixed(0)} ${listing.price.valute.symbol}',
            style: GoogleFonts.lato(
              fontWeight: FontWeight.w600,
              color: Colors.red[900],
              fontSize: 16.0,
            ),
          ),
          Text(
            '${listing.mileage}KM · ${listing.year}',
            style: GoogleFonts.lato(
              fontWeight: FontWeight.w500,
              color: Colors.black54,
              fontSize: 12.0,
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
        listing.title,
        style: GoogleFonts.lato(
          fontWeight: FontWeight.w700,
          color: Colors.black87,
          fontSize: 16.0,
          wordSpacing: -0.75,
          letterSpacing: 0.0,
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
    return GestureDetector(
      onTap: () => showCupertinoModalBottomSheet(
        expand: false,
        context: context,
        builder: (context) => ListingDetailScreen(listing: listing),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(index.isOdd ? 8.0 : 0.0),
            topRight: Radius.circular(index.isEven ? 8.0 : 0.0),
            bottomLeft: Radius.circular(index.isOdd ? 8.0 : 0.0),
            bottomRight: Radius.circular(index.isEven ? 8.0 : 0.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade500,
              blurRadius: 0.25,
              offset: Offset(0.1, 0.1),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildPreview(context),
            _buildData(context),
          ],
        ),
      ),
    );
  }
}
