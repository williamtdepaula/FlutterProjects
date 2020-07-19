import 'package:flutter/material.dart';

const Color _color = Color(0xFF1D1E33);

class ReusableCard extends StatelessWidget {
  final Widget childCard;
  final Color colorOfCard;
  final Function onTapCard;

  ReusableCard({this.childCard, this.colorOfCard = _color, this.onTapCard});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTapCard,
        child: Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: colorOfCard,
            borderRadius: BorderRadius.circular(20),
          ),
          child: childCard,
        ),
      ),
    );
  }
}
