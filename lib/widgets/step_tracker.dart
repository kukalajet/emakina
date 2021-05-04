import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StepTracker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ClipOval(
          child: Container(
            height: 50.0,
            width: 50.0,
            child: Center(
              child: Text(
                "1",
                style: GoogleFonts.lato(
                  color: Colors.white,
                  textStyle: Theme.of(context).textTheme.headline5,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
                  Colors.red.shade200,
                  Colors.red.shade800,
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.redAccent,
                  blurRadius: 1.0,
                  spreadRadius: 1.0,
                  offset: Offset(0.0, 0.0),
                ),
              ],
            ),
          ),
        ),
        ClipOval(
          child: Container(
            height: 50.0,
            width: 50.0,
            child: Center(
              child: Text(
                "2",
                style: GoogleFonts.lato(
                  color: Colors.white,
                  textStyle: Theme.of(context).textTheme.headline5,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
                  Colors.red.shade200,
                  Colors.red.shade800,
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.redAccent,
                  blurRadius: 1.0,
                  spreadRadius: 1.0,
                  offset: Offset(0.0, 0.0),
                ),
              ],
            ),
          ),
        ),
        ClipOval(
          child: Container(
            height: 50.0,
            width: 50.0,
            child: Center(
              child: Text(
                "3",
                style: GoogleFonts.lato(
                  color: Colors.white,
                  textStyle: Theme.of(context).textTheme.headline5,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
                  Colors.grey.shade300,
                  Colors.blueGrey,
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.redAccent,
                  blurRadius: 1.0,
                  spreadRadius: 1.0,
                  offset: Offset(0.0, 0.0),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
