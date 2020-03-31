import 'package:flutter/material.dart';

class Helper {
  static pushNavigator(BuildContext context, route, {replace = false}) {
    if (!replace)
      Navigator.push(
          context, MaterialPageRoute(builder: (BuildContext context) => route));
    else
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (BuildContext context) => route));
  }

  static popNavigator(BuildContext context, {params}) {
    Navigator.pop(context, params);
  }

  static convertDynamicListToStringList(List list) => list != null
      ? list.map<String>((role) => role.toString()).toList()
      : null;

  static alert(
    BuildContext context, {
    title = 'Ops, ocorreu um erro',
    @required Widget content,
    Function callback,
  }) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              title,
              style: TextStyle(color: Colors.white),
            ),
            content: content,
            backgroundColor: Colors.black26,
            contentTextStyle: TextStyle(color: Colors.white),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    popNavigator(context);
                    callback();
                  },
                  child: Text('Ok'))
            ],
          );
        });
  }
}
