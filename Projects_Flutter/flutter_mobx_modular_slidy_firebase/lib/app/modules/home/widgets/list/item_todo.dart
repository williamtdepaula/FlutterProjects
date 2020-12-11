import 'package:flutter/material.dart';

class ItemTodo extends StatelessWidget {
  final String item;
  final Function onRemove;

  ItemTodo({this.item, this.onRemove});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(item),
      trailing: IconButton(
        icon: Icon(
          Icons.delete,
          color: Colors.red,
        ),
        onPressed: () => this.onRemove(this.item),
      ),
    );
  }
}
