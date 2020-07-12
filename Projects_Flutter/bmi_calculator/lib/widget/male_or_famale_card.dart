import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MaleOrFemaleCard extends StatelessWidget {
  final IconData iconName;
  final String text;

  MaleOrFemaleCard({this.iconName, this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Icon(
            this.iconName,
            size: 70,
            color: Color(0xFF8D8E98),
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            this.text,
            style: TextStyle(fontSize: 20, color: Color(0xFF8D8E98)),
          ),
        ),
      ],
    );
  }
}
