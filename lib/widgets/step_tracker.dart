import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StepTracker extends StatelessWidget {
  const StepTracker({@required this.currentStep});

  final int currentStep;

  Widget _buildStep(BuildContext context, int step) {
    return ClipOval(
      child: Container(
        height: 50.0,
        width: 50.0,
        child: Center(
          child: Text(
            step.toString(),
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
            colors: currentStep >= step
                ? <Color>[
                    Colors.red.shade200,
                    Colors.red.shade800,
                  ]
                : <Color>[
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildStep(context, 1),
        _buildStep(context, 2),
        _buildStep(context, 3),
      ],
    );
  }
}
