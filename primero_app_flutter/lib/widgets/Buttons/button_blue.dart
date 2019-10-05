import 'package:flutter/material.dart';

class BlueButton extends StatelessWidget {
  String text;
  Color color;
  Function onPressed;

  BlueButton(this.text, {this.onPressed, this.color = Colors.green});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: color,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      onPressed: onPressed,
    );
  }
}
