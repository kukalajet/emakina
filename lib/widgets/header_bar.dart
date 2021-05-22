import 'package:emakina/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderBar extends StatelessWidget {
  Widget _buildTitle() {
    return Text(
      'eMakina',
      style: GoogleFonts.lato(
        textStyle: TextStyle(
          color: Colors.red[900],
          fontSize: 25.0,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }

  List<Widget> _buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(
          Icons.search_rounded,
          color: Colors.red[900],
          size: 32.0,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SearchScreen()),
          );
        },
      ),
      Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: IconButton(
          icon: Icon(
            Icons.person_rounded,
            color: Colors.red[900],
            size: 32.0,
          ),
          onPressed: () {},
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      bottomOpacity: 0.0,
      elevation: 0.0,
      title: _buildTitle(),
      actions: _buildActions(context),
    );
  }
}
