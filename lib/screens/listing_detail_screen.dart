import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:emakina/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:listing_repository/listing_repository.dart';

class ListingDetailScreen extends StatefulWidget {
  const ListingDetailScreen({
    @required this.listing,
  });

  final Listing listing;

  @override
  _ListingDetailScreenState createState() => _ListingDetailScreenState();
}

class _ListingDetailScreenState extends State<ListingDetailScreen> {
  int _currentImage;

  @override
  void initState() {
    super.initState();
    _currentImage = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Scaffold(
          bottomSheet: _buildBottomSheet(),
          body: _buildBody(),
        ),
      ),
    );
  }

  Widget _buildBottomSheet() {
    return Container(
      height: 72.0,
      child: Center(child: Text('todo')),
    );
  }

  Widget _buildBody() {
    return ListView(
      reverse: false,
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      children: <Widget>[
        _buildHeader(),
        _buildHeaderTile(),
        _buildFormBody(),
      ],
    );
  }

  Widget _buildHeader() {
    return Stack(
      children: <Widget>[
        CarouselSlider(
          items: widget.listing.images.map((image) {
            double width = MediaQuery.of(context).size.width;

            return Container(
              width: width,
              decoration: BoxDecoration(color: Colors.amber),
              child: CachedNetworkImage(
                imageUrl: image,
                placeholder: (context, url) => Container(
                  height: 272.0,
                  child: Center(child: CircularProgressIndicator()),
                ),
                fit: BoxFit.cover,
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            );
          }).toList(),
          options: CarouselOptions(
            height: 272.0,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 5),
            viewportFraction: 1.0,
            onPageChanged: (index, reason) =>
                setState(() => _currentImage = index),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.listing.images.map((image) {
            int index = widget.listing.images.indexOf(image);
            return Container(
              width: 8.0,
              height: 8.0,
              margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 2.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentImage == index
                    ? Color.fromRGBO(0, 0, 0, 0.8)
                    : Color.fromRGBO(0, 0, 0, 0.4),
              ),
            );
          }).toList(),
        ),
        _buildBackButton(),
      ],
    );
  }

  Widget _buildBackButton() {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: IconButton(
          icon: Icon(Icons.arrow_back_ios_rounded),
          onPressed: () => Navigator.pop(context, false),
        ),
      ),
    );
  }

  Widget _buildHeaderTile() {
    final title = widget.listing.title;
    final model = widget.listing.model.name;
    final manufacturer = widget.listing.manufacturer.name;

    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Text(
                    manufacturer,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ],
              ),
              MaterialButton(
                onPressed: () => {},
                color: const Color(0xffE57373),
                textColor: Colors.white70,
                child: const Icon(Icons.favorite, size: 20),
                padding: const EdgeInsets.all(8.0),
                shape: const CircleBorder(),
                minWidth: 0.0,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFormBody() {
    final description = widget.listing.description;
    final location = widget.listing.location.name;
    final mileage = widget.listing.mileage;
    final matriculation = widget.listing.year;
    final transmission = widget.listing.transmission.type;
    final fuel = widget.listing.fuel.type;
    final plate = widget.listing.plate.name;
    final type = widget.listing.type.name;
    final color = widget.listing.color.name;
    final colorCode = widget.listing.color.code;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextFormField(
            initialValue: description,
            maxLines: null,
            readOnly: true,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey.shade100,
              labelText: 'Description',
              labelStyle: TextStyle(
                color: Colors.red.shade800,
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red.shade800, width: 1.0),
              ),
            ),
          ),
          const Padding(padding: EdgeInsets.all(8.0)),
          TextFormField(
            initialValue: location,
            maxLines: null,
            readOnly: true,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey.shade100,
              labelText: 'Location',
              labelStyle: TextStyle(
                color: Colors.red.shade800,
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red.shade800, width: 1.0),
              ),
              prefixIcon: Icon(
                const IconData(0x1F4CD, fontFamily: 'MaterialIcons'),
              ),
            ),
          ),
          const Padding(padding: EdgeInsets.all(8.0)),
          TextFormField(
            initialValue: mileage.toString(),
            maxLines: null,
            readOnly: true,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey.shade100,
              labelText: 'Mileage',
              suffixText: 'KM',
              labelStyle: TextStyle(
                color: Colors.red.shade800,
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red.shade800, width: 1.0),
              ),
              prefixIcon: Icon(
                const IconData(0x1F4CF, fontFamily: 'MaterialIcons'),
              ),
            ),
          ),
          const Padding(padding: EdgeInsets.all(8.0)),
          TextFormField(
            initialValue: matriculation.toString(),
            maxLines: null,
            readOnly: true,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey.shade100,
              labelText: 'Matriculation',
              labelStyle: TextStyle(
                color: Colors.red.shade800,
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red.shade800, width: 1.0),
              ),
              prefixIcon: Icon(
                const IconData(0x1F4C5, fontFamily: 'MaterialIcons'),
              ),
            ),
          ),
          const Padding(padding: EdgeInsets.all(8.0)),
          TextFormField(
            initialValue: transmission,
            maxLines: null,
            readOnly: true,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey.shade100,
              labelText: 'Transmission',
              labelStyle: TextStyle(
                color: Colors.red.shade800,
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red.shade800, width: 1.0),
              ),
              prefixIcon: Icon(
                const IconData(0x2699, fontFamily: 'MaterialIcons'),
              ),
            ),
          ),
          const Padding(padding: EdgeInsets.all(8.0)),
          TextFormField(
            initialValue: fuel,
            maxLines: null,
            readOnly: true,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey.shade100,
              labelText: 'Fuel',
              labelStyle: TextStyle(
                color: Colors.red.shade800,
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red.shade800, width: 1.0),
              ),
              prefixIcon: Icon(
                const IconData(0x26FD, fontFamily: 'MaterialIcons'),
              ),
            ),
          ),
          const Padding(padding: EdgeInsets.all(8.0)),
          TextFormField(
            initialValue: plate,
            maxLines: null,
            readOnly: true,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey.shade100,
              labelText: 'Plate',
              labelStyle: TextStyle(
                color: Colors.red.shade800,
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red.shade800, width: 1.0),
              ),
              prefixIcon: Icon(
                const IconData(0x1F30D, fontFamily: 'MaterialIcons'),
              ),
            ),
          ),
          const Padding(padding: EdgeInsets.all(8.0)),
          TextFormField(
            initialValue: type,
            maxLines: null,
            readOnly: true,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey.shade100,
              labelText: 'Vehicle Type',
              labelStyle: TextStyle(
                color: Colors.red.shade800,
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red.shade800, width: 1.0),
              ),
              prefixIcon: Icon(
                const IconData(0x1F3CE, fontFamily: 'MaterialIcons'),
              ),
            ),
          ),
          const Padding(padding: EdgeInsets.all(8.0)),
          TextFormField(
            initialValue: color,
            maxLines: null,
            readOnly: true,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey.shade100,
              labelText: 'Color',
              labelStyle: TextStyle(
                color: Colors.red.shade800,
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red.shade800, width: 1.0),
              ),
              suffixIcon:
                  Icon(Icons.circle, color: HexColor.fromHex(colorCode)),
              prefixIcon: Icon(
                const IconData(0x1F308, fontFamily: 'MaterialIcons'),
              ),
            ),
          ),
          SizedBox(height: 72.0),
        ],
      ),
    );
  }
}
