import 'package:bmi_calculator/utils/constants.dart';
import 'package:flutter/material.dart';

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
            color: kColorText,
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            this.text,
            style: kLabelTextStyle,
          ),
        ),
      ],
    );
  }
}
