import 'package:flutter/material.dart';

class Helper {
  static navigate(BuildContext context, Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => page));
  }

  static pop(BuildContext context){
    Navigator.pop(context);
  }
}
