import 'package:flutter/material.dart';

Future push(BuildContext context, Widget page) {
  return Navigator.push(
    context,
    MaterialPageRoute(builder: (BuildContext context) => page),
  );
}

pop(BuildContext context, String param){
  return Navigator.pop(context, param);
}
