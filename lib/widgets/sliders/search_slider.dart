import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchSlider extends StatefulWidget {
  final int lowerValue;
  final int upperValue;
  final Function(double, double) onSubmit;
  final int lowerPossibleValue;
  final int upperPossibleValue;
  final String suffix;
  final String description;
  final double divider;

  const SearchSlider({
    @required this.lowerValue,
    @required this.upperValue,
    @required this.onSubmit,
    @required this.lowerPossibleValue,
    @required this.upperPossibleValue,
    @required this.divider,
    @required this.description,
    this.suffix,
  });

  @override
  _SearchSliderState createState() => _SearchSliderState();
}

class _SearchSliderState extends State<SearchSlider> {
  RangeValues _values;
  RangeLabels _labels;

  double get _lowerValue {
    if (widget.lowerValue != null) return widget.lowerValue.toDouble();
    return widget.lowerPossibleValue.toDouble();
  }

  double get _upperValue {
    if (widget.upperValue != null) return widget.upperValue.toDouble();
    return widget.upperPossibleValue.toDouble();
  }

  String _getUpperValueLabel(double value) {
    if (value == widget.upperPossibleValue)
      return '+${widget.upperPossibleValue.toInt()} ${widget.suffix ?? ''}';
    return '${value.toInt()} ${widget.suffix ?? ''}';
  }

  @override
  void initState() {
    super.initState();
    _values = RangeValues(_lowerValue, _upperValue);
    _labels = RangeLabels(
      '${widget.lowerPossibleValue.toInt()} ${widget.suffix ?? ''}',
      '+${widget.upperPossibleValue.toInt()} ${widget.suffix ?? ''}',
    );
  }

  Widget _buildMessage() {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          widget.description,
          style: GoogleFonts.lato(
            textStyle: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.black54,
              fontSize: 22.0,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSubmit(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextButton(
          style: ButtonStyle(
            padding: MaterialStateProperty.all(
                EdgeInsets.symmetric(horizontal: 8.0)),
            backgroundColor: MaterialStateProperty.all(Colors.red.shade900),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24.0),
              ),
            ),
          ),
          child: Text(
            'SUBMIT',
            style: GoogleFonts.lato(
              fontSize: 14.0,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          onPressed: () {
            final lowerValue = _values.start;
            final upperValue = _values.end;

            widget.onSubmit(lowerValue, upperValue);
            Navigator.pop(context);
          },
        ),
      ),
    );
  }

  Widget _buildSlider() {
    return Padding(
      padding: const EdgeInsets.only(
          top: 16.0, right: 16.0, left: 16.0, bottom: 32.0),
      child: SliderTheme(
        data: SliderThemeData(trackHeight: 2),
        child: Center(
          child: Container(
            height: 50.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              gradient: LinearGradient(
                colors: [Colors.red.shade900, Colors.red.shade600],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(1.0, 1.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp,
              ),
            ),
            child: RangeSlider(
              divisions: widget.upperPossibleValue ~/ widget.divider,
              activeColor: Colors.white,
              inactiveColor: Colors.white.withOpacity(.5),
              min: widget.lowerPossibleValue.toDouble(),
              max: widget.upperPossibleValue.toDouble(),
              values: _values,
              labels: _labels,
              onChanged: (value) {
                setState(() {
                  _values = value;
                  _labels = RangeLabels(
                    value.start.toInt().toString() + ' ${widget.suffix ?? ''}',
                    _getUpperValueLabel(value.end),
                  );
                });
              },
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Container(
          decoration: BoxDecoration(color: Colors.white),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                children: [
                  _buildMessage(),
                  _buildSubmit(context),
                ],
              ),
              _buildSlider(),
            ],
          ),
        ),
      ),
    );
  }
}
