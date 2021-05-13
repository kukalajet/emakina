import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerField extends StatelessWidget {
  const ImagePickerField({
    @required this.images,
    @required this.onAdd,
    @required this.onRemove,
  });

  final List<String> images;
  final Function(String) onAdd;
  final Function(String) onRemove;

  Future _getImage() async {
    final picker = ImagePicker();
    final file = await picker.getImage(source: ImageSource.gallery);
    onAdd(file.path);
  }

  Widget _buildFirstAdditionButton() {
    final style = ElevatedButton.styleFrom(
      primary: Colors.red.shade800,
      onPrimary: Colors.white,
      minimumSize: Size(double.infinity, 45),
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(22.5)),
      ),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ElevatedButton(
        style: style,
        onPressed: _getImage,
        child: Row(
          children: <Widget>[
            Icon(Icons.image_outlined, color: Colors.white),
            Spacer(),
            Text("ADD PICS", style: TextStyle(color: Colors.white)),
            Spacer(),
          ],
        ),
      ),
    );
  }

  Widget _buildImagesContainer(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: 125.0,
      width: size.width,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: images
            .map((image) => _buildImage(image))
            .followedBy(images.length < 6 ? [_buildAddButton()] : [])
            .toList(),
      ),
    );
  }

  Widget _buildImage(String path) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Stack(
        children: [
          Container(
            height: 125.0,
            width: 125.0,
            child: Image.file(File(path), fit: BoxFit.cover),
          ),
          Positioned(
            top: 0.0,
            right: 0.0,
            child: IconButton(
              icon: Icon(Icons.close, size: 24.0),
              onPressed: () => onRemove(path),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddButton() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ButtonTheme(
          minWidth: 32.0,
          height: 32.0,
          child: ElevatedButton(
            onPressed: _getImage,
            child: Icon(Icons.add),
            style: ElevatedButton.styleFrom(
              shape: CircleBorder(),
              primary: Colors.red.shade800,
              onPrimary: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 500),
      child: images == null || images.isEmpty
          ? _buildFirstAdditionButton()
          : _buildImagesContainer(context),
    );
  }
}
