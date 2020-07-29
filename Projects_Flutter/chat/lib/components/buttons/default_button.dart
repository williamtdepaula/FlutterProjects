import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final Function onPress;
  final String text;
  final Color buttonColor;
  final Color textColor;
  final double elevation;

  DefaultButton({
    @required this.onPress,
    @required this.text,
    this.buttonColor = Colors.green,
    this.textColor = Colors.white,
    this.elevation = 3.0,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      constraints: BoxConstraints.expand(width: size.width / 1.2, height: 50),
      margin: EdgeInsets.all(10),
      child: RawMaterialButton(
        onPressed: onPress,
        fillColor: buttonColor,
        elevation: elevation,
        highlightElevation: elevation,
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: 16,
            fontWeight: FontWeight.w900
          ),
        ),
      ),
    );
  }
}
