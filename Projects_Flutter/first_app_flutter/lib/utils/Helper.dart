import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Helper {
  static pushNavigatior(BuildContext context, page) async {
    String value = await Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) {
      return page;
    }));

    print(value);
  }

  static popNavigator(BuildContext context, {params}) {
    Navigator.pop(context, params);
  }

  static showSnackBar(BuildContext context, String text) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(text),
    ));
  }

  static alert(BuildContext context, String text) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(text),
          actions: <Widget>[
            FlatButton(onPressed: () => Helper.popNavigator(context), child: Text('CANCELAR')),
            FlatButton(onPressed: () => print('OK'), child: Text('OK'))
          ],
        );
      },
    );
  }

  static toast(String text){
    Fluttertoast.showToast(msg: text);
  }
}
