import 'package:emakina/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:listing_repository/listing_repository.dart';

class ListingTile extends StatelessWidget {
  const ListingTile({@required this.listing});

  final Listing listing;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.0),
      child: Card(
        elevation: 2.0,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: InkWell(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildPreview(context),
              _buildInfo(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPreview(BuildContext context) {
    return Stack(
      children: [
        _buildPreviewImage(),
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: MaterialButton(
              onPressed: () => context
                  .read<FavoriteBloc>()
                  .add(FavoriteSaved(favorite: listing)),
              color: Colors.white,
              child:
                  const Icon(Icons.bookmark, color: Colors.black38, size: 24.0),
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
    String url =
        "https://images.unsplash.com/photo-1573005354915-e953e442df41?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1534&q=80";

    return CachedNetworkImage(
      imageUrl: url,
      imageBuilder: (context, imageProvider) => Container(
        height: 128.0,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
      placeholder: (context, url) => Container(
        height: 128.0,
        child: Center(child: CircularProgressIndicator()),
      ),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }

  Widget _buildInfo(BuildContext context) {
    return Container(
      height: 128.0,
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: MaterialButton(
              onPressed: () => null,
              color: Colors.green,
              textColor: Colors.white70,
              child: const Icon(Icons.call, size: 22.0),
              padding: const EdgeInsets.all(12.0),
              shape: const CircleBorder(),
              minWidth: 0.0,
            ),
          ),
          _buildData(context),
        ],
      ),
    );
  }

  Widget _buildData(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildPrice(context),
                  _buildTitle(context),
                ],
              )
            ],
          ),
          _buildChips(context),
        ],
      ),
    );
  }

  Widget _buildPrice(BuildContext context) {
    return Text(
      '2400 €',
      style: Theme.of(context).textTheme.headline4,
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Text(
      'MERCEDES BENZ CLK320',
      style: Theme.of(context).textTheme.headline6,
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      softWrap: false,
    );
  }

  Widget _buildChips(BuildContext context) {
    return Row(
      children: [
        _buildChip(context, '200000 KM'),
        _buildChip(context, '2018'),
        _buildChip(context, 'Automatik'),
      ],
    );
  }

  Widget _buildChip(BuildContext context, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.0),
      child: Chip(
        label: Text(
          value,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        backgroundColor: Colors.grey.shade200,
      ),
    );
  }
}
