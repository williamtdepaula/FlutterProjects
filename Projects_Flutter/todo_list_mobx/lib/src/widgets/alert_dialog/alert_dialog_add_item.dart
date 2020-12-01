import 'package:flutter/material.dart';
import 'package:todo_list_mobx/src/models/item_model.dart';

showAlertDialogAddItem(
  BuildContext context, {
  Function onCreateItem,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialogAddItem(onCreateItem: onCreateItem);
    },
  );
}

class AlertDialogAddItem extends StatelessWidget {
  final ItemModel itemModel = new ItemModel();

  final Function onCreateItem;

  AlertDialogAddItem({this.onCreateItem});

  void closeDialog(BuildContext context) {
    Navigator.pop(context);
  }

  void saveNewItem(BuildContext context) {
    if (itemModel.title.isNotEmpty) {
      this.onCreateItem(itemModel);
      closeDialog(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Adicionar item'),
      content: TextField(
        decoration: InputDecoration(
          labelText: 'Novo item',
        ),
        onChanged: itemModel.setTitle,
      ),
      actions: [
        TextButton(
          onPressed: () => closeDialog(context),
          child: Text('Cancelar'),
        ),
        TextButton(
          onPressed: () => saveNewItem(context),
          child: Text('Salvar'),
        ),
      ],
    );
  }
}
