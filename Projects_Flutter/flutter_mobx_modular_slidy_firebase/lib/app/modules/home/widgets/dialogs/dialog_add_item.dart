import 'package:flutter/material.dart';
import 'package:flutter_mobx_modular_slidy_firebase/app/modules/home/home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

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
  HomeController _homeController = Modular.get<HomeController>();

  final Function onCreateItem;

  AlertDialogAddItem({this.onCreateItem});

  void closeDialog(BuildContext context) {
    Navigator.pop(context);
  }

  void saveNewItem(BuildContext context) {
    if (_homeController.item.isNotEmpty) {
      _homeController.addItem();
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
        onChanged: _homeController.setItem,
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
