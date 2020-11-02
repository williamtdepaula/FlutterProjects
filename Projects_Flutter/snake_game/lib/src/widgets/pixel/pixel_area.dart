import 'package:flutter/material.dart';

class PixelArea extends StatelessWidget {
  final bool isSnake;
  final bool isPoint;

  PixelArea({
    this.isSnake = false,
    this.isPoint = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      margin: EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(1),
        color: this.isPoint
            ? Colors.green
            : isSnake
                ? Colors.white
                : Color(0xFF212121),
      ),
    );
  }
}
