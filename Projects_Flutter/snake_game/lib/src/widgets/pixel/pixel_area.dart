import 'package:flutter/material.dart';

class PixelArea extends StatelessWidget {
  final bool isSnake;
  final bool isPoint;
  final bool isSuperPoint;
  final Color snakeColor;

  PixelArea({
    this.isSnake = false,
    this.isPoint = false,
    this.isSuperPoint = false,
    this.snakeColor = Colors.white,
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
                ? this.snakeColor
                : isSuperPoint
                    ? Colors.orange
                    : Color(0xFF212121),
      ),
    );
  }
}
