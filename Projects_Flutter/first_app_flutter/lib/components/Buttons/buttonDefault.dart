import 'package:flutter/material.dart';

class ButtonDefault extends StatelessWidget{

  String textButton;
  Function onPress;
  Color colorButton;
  TextStyle styleTextButton;

  ButtonDefault(this.textButton, this.onPress, {this.colorButton, this.styleTextButton});

  @override
  Widget build(BuildContext context){
    return _handleRenderButtom(textButton, onPress, colorButton: this.colorButton, styleTextButton: this.styleTextButton );
  }
}
/*
Widget ButtonDefault(textButton, onPress) {
  return _handleRenderButtom(textButton, () => onPress());
}*/

RaisedButton _handleRenderButtom(String textButton, onPress, {colorButton, styleTextButton}) {
  return RaisedButton(
    color: colorButton != null ? colorButton : Colors.blue,
    child: Text(
      textButton,
      style: styleTextButton != null ? styleTextButton : TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    onPressed: onPress,
  );
}
