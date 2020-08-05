import 'package:flutter/material.dart';

class ButtonLinked extends StatelessWidget {
  final String text;
  final String route;

  ButtonLinked({this.text, this.route});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: InkWell(
        onTap: () =>
            Navigator.pushNamedAndRemoveUntil(context, route, (route) => false),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.blue,
            fontSize: 14,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
