import 'package:chat/models/message.dart';
import 'package:flutter/material.dart';

enum BubblePosition {
  left,
  right,
}

class Bubble extends StatelessWidget {
  final Message message;

  Bubble({this.message});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      alignment: message.position == BubblePosition.left
          ? Alignment.centerLeft
          : Alignment.centerRight,
      child: Column(
        children: <Widget>[
          Container(
            constraints:
                BoxConstraints(minWidth: 30, maxWidth: size.width / 1.5),
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              message.text,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
