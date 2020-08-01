import 'package:flutter/material.dart';

class Helper{
  static alert(context){
    showDialog(context: context, builder: (BuildContext context){
      return (
        AlertDialog(
          title: Container(
            color: Colors.red,
          ),
          
        )
      );
    });
  }

}