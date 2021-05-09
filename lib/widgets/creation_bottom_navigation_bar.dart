import 'package:flutter/material.dart';

class CreationBottomNavigationBar extends StatelessWidget {
  const CreationBottomNavigationBar({
    @required this.onBackPressed,
    @required this.onNextPressed,
    @required this.onSubmitPressed,
    @required this.showBack,
    @required this.showSubmit,
  });

  final Function() onBackPressed;
  final Function() onNextPressed;
  final Function() onSubmitPressed;
  final bool showBack;
  final bool showSubmit;

  Widget _buildButton(
    String title,
    Function() onPressed,
  ) {
    final ButtonStyle style = ElevatedButton.styleFrom(
      primary: Colors.red.shade800,
      onPrimary: Colors.white,
      minimumSize: Size(140, 45),
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(22.5)),
      ),
    );

    return ElevatedButton(
      style: style,
      onPressed: onPressed,
      child: Text(title),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(24.0, 2.0, 24.0, 48.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AnimatedSwitcher(
            duration: Duration(milliseconds: 250),
            child: showBack ? _buildButton("BACK", onBackPressed) : SizedBox(),
          ),
          AnimatedSwitcher(
            duration: Duration(milliseconds: 250),
            child: showSubmit
                ? _buildButton("SUBMIT", onSubmitPressed)
                : _buildButton("NEXT", onNextPressed),
          ),
        ],
      ),
    );
  }
}
