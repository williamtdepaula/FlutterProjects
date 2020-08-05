import 'package:flutter/material.dart';

class Helper {
  static alertDeleteMessage(BuildContext context, Function pressed) {
    void clickOnOption(option){
      pressed(option);
      Navigator.pop(context);
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Excluir mensagem'),
          content: Text('Você tem certeza que deseja excluir?'),
          actions: <Widget>[
            MaterialButton(
              onPressed: () => clickOnOption(0),
              child: Text('NÃO'),
            ),
            MaterialButton(
              onPressed: () => clickOnOption(1),
              child: Text('SIM'),
            )
          ],
        );
      },
    );
  }
}
