import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class TextFormPickerField extends StatelessWidget {
  const TextFormPickerField({
    @required this.value,
    @required this.labelText,
    @required this.picker,
    this.padding,
  });

  final String value;
  final String labelText;
  final Widget picker;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: TextFormField(
        controller: TextEditingController(text: value),
        onTap: () => showCupertinoModalBottomSheet(
          expand: false,
          context: context,
          backgroundColor: Colors.transparent,
          builder: (context) => picker,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey.shade200,
          labelText: labelText,
          labelStyle: TextStyle(
            color: Colors.red.shade800,
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red.shade800, width: 2.0),
          ),
        ),
      ),
    );
  }
}
