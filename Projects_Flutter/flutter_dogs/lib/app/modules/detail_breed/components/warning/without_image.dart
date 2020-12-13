import 'package:flutter/material.dart';

class WithoutImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Sem imagens, tente novamente!',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w300,
          color: Colors.black45,
        ),
      ),
    );
  }
}
