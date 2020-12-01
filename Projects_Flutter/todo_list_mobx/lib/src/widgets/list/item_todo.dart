import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:todo_list_mobx/src/models/item_model.dart';

class ItemTodo extends StatelessWidget {
  final ItemModel itemModel;
  final Function onRemove;

  ItemTodo({this.itemModel, this.onRemove});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Observer(builder: (_) {
        return Checkbox(
          value: itemModel.checked,
          onChanged: itemModel.setChecked,
        );
      }),
      title: Text(itemModel.title),
      trailing: IconButton(
        icon: Icon(
          Icons.delete,
          color: Colors.red,
        ),
        onPressed: () => this.onRemove(this.itemModel),
      ),
    );
  }
}
