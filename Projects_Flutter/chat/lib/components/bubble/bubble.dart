import 'package:chat/blocs/bubble.bloc.dart';
import 'package:chat/models/message.dart';
import 'package:chat/utils/Helper.dart';
import 'package:flutter/material.dart';

enum BubblePosition {
  left,
  right,
}

class Bubble extends StatefulWidget{
  final Message message;

  Bubble({this.message});

  @override
  _BubbleState createState () => _BubbleState();
}

class _BubbleState extends State<Bubble> {

  BubbleBloc _bubbleBloc = new BubbleBloc();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: widget.message.position == BubblePosition.left
          ? Alignment.centerLeft
          : Alignment.centerRight,
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: widget.message.position == BubblePosition.left
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.end,
        children: <Widget>[
          _handlerRenderMessage(context),
          widget.message.position == BubblePosition.left
              ? _handlerRenderWhoPost()
              : Container(),
        ],
      ),
    );
  }

  _handlerRenderMessage(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onLongPress: () => _bubbleBloc.onLongPress(context, widget.message),
      child: Container(
        constraints: BoxConstraints(
            minWidth: size.width / 5, maxWidth: size.width / 1.5),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: widget.message.position == BubblePosition.left
                ? Colors.teal
                : Colors.green,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
              topLeft: widget.message.position == BubblePosition.left
                  ? Radius.circular(0)
                  : Radius.circular(20),
              topRight: widget.message.position == BubblePosition.right
                  ? Radius.circular(0)
                  : Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                  offset: Offset(1, 5),
                  blurRadius: 5.0,
                  spreadRadius: 0.1,
                  color: widget.message.position == BubblePosition.left
                      ? Colors.teal
                      : Colors.green),
            ]),
        child: Text(
          widget.message.text,
          textAlign: TextAlign.left,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  _handlerRenderWhoPost() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Text(
        widget.message.user.name,
        textAlign: TextAlign.right,
        style: TextStyle(
          fontSize: 16,
          color: Colors.grey,
        ),
      ),
    );
  }
}
