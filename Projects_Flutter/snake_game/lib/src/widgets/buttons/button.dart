import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Function onPressed;
  final String text;
  final Color colorText;
  final Color backgroundColor;

  Button({
    this.onPressed,
    this.text,
    this.colorText = Colors.white,
    this.backgroundColor = Colors.green,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onPressed,
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: this.backgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          this.text,
          style: TextStyle(
            color: this.colorText,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
