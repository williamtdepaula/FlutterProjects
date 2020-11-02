import 'package:flutter/material.dart';

class ButtonPause extends StatelessWidget {
  final Function onPressed;
  final bool paused;

  ButtonPause({
    this.onPressed,
    this.paused = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onPressed,
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: !paused ? Colors.red : Colors.green,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          !paused ? "Pausar" : "Voltar",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
