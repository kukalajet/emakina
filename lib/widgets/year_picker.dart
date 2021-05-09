import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:listing_repository/listing_repository.dart';

class AppYearPicker extends StatefulWidget {
  const AppYearPicker({@required this.onConfirm});

  final Function(Date) onConfirm;

  @override
  _AppYearPickerState createState() => _AppYearPickerState();
}

class _AppYearPickerState extends State<AppYearPicker> {
  int _currentIndex = 0;

  int year(int index) => (2021 - index);

  Widget _buildMessage() {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'Choose registration year:',
          style: GoogleFonts.lato(
            textStyle: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.black45,
              fontSize: 22.0,
            ),
          ),
        ),
      ),
    );
  }

  // TODO: Change button type.
  Widget _buildSubmit() {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.only(top: 4.0, right: 8.0),
        child: TextButton(
          child: Text(
            'SUBMIT',
            style: GoogleFonts.lato(
              textStyle: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.black45,
                fontSize: 18.0,
              ),
            ),
          ),
          onPressed: () {
            final date = Date(day: 1, month: 1, year: year(_currentIndex));
            widget.onConfirm(date);
            Navigator.pop(context);
          },
        ),
      ),
    );
  }

  Widget _buildPicker() {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 32.0, top: 56.0),
        child: ListWheelScrollView(
          itemExtent: 60,
          diameterRatio: 1.5,
          magnification: 1.2,
          useMagnifier: true,
          overAndUnderCenterOpacity: .5,
          onSelectedItemChanged: (int index) =>
              setState(() => _currentIndex = index),
          children: List.generate(
            77,
            (i) => ListTile(
              tileColor: Colors.white54,
              title: Center(
                child: Text(
                  "${year(i)}",
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 32.0,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        height: 300.0,
        child: Stack(
          children: [
            _buildMessage(),
            _buildSubmit(),
            _buildPicker(),
          ],
        ),
      ),
    );
  }
}
