import 'package:flutter/material.dart';

class LargeButton extends StatelessWidget {
  final String text;
  final Function onTap;

  LargeButton({this.text, this.onTap});

  @override
  Widget build(BuildContext build) {
    return InkWell(
      onTap: this.onTap,
      child: Container(
        alignment: Alignment.center,
        color: Color(0xFFEB1555),
        margin: EdgeInsets.only(top: 10),
        width: double.infinity,
        height: 80,
        padding: EdgeInsets.only(bottom: 20),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w900
          ),
        ),
      ),
    );
  }
}
