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
    return Container(
      alignment: message.position == BubblePosition.left
          ? Alignment.centerLeft
          : Alignment.centerRight,
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: message.position == BubblePosition.left
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.end,
        children: <Widget>[
          _handlerRenderMessage(context),
          message.position == BubblePosition.left
              ? _handlerRenderWhoPost()
              : Container(),
        ],
      ),
    );
  }

  _handlerRenderMessage(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      constraints:
          BoxConstraints(minWidth: size.width / 5, maxWidth: size.width / 1.5),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: message.position == BubblePosition.left
              ? Colors.teal
              : Colors.green,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
              topLeft: Radius.circular(20)),
          boxShadow: [
            BoxShadow(
                offset: Offset(1, 5),
                blurRadius: 5.0,
                spreadRadius: 0.1,
                color: message.position == BubblePosition.left
                    ? Colors.teal
                    : Colors.green),
          ]),
      child: Text(
        message.text,
        textAlign: message.position == BubblePosition.left
            ? TextAlign.right
            : TextAlign.left,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }

  _handlerRenderWhoPost() {
    return Container(
      child: Text(
        this.message.user.name,
        textAlign: TextAlign.right,
        style: TextStyle(
          fontSize: 16,
          color: Colors.grey,
        ),
      ),
    );
  }
}
