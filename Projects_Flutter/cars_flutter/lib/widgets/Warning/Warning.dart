import 'package:flutter/material.dart';

class Warning extends StatelessWidget {
  String text;

  Warning(this.text);

  @override
  Widget build(BuildContext buildContext) {
    return Center(
        child: Text(
          this.text,
          textAlign: TextAlign.center,          
          style: TextStyle(
            color: Colors.red,
            fontSize: 20,
            fontWeight: FontWeight.bold,

          ),
        ),
    );
  }
}
