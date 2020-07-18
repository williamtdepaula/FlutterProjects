import 'package:flutter/material.dart';

enum CircleButtonAddOrRemoveType {
  add,
  remove,
}

class CircleButtonAddOrRemove extends StatelessWidget {
  CircleButtonAddOrRemoveType type = CircleButtonAddOrRemoveType.add;
  Function onTap;

  CircleButtonAddOrRemove({this.type, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      padding: EdgeInsets.all(5),
      onPressed: onTap,
      elevation: 10.0,
      constraints: BoxConstraints.expand(height: 50, width: 50),
      child: Icon(
        type == CircleButtonAddOrRemoveType.add ? Icons.add : Icons.remove,
        size: 25,
      ),
    );
  }
}
