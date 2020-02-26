import 'package:flutter/material.dart';

class TextInputDefault extends StatelessWidget {
  String label;
  String hint;
  bool password;
  final controller;
  FormFieldValidator<String> validator;
  TextInputAction actionTextInput;
  TextInputType textInputType;
  FocusNode focusNode;
  FocusNode nextFocus;

  TextInputDefault(
    //Constructor
    this.label,
    this.hint, {
    @required this.controller,
    this.password = false,
    this.validator,
    this.actionTextInput = TextInputAction.unspecified,
    this.textInputType = TextInputType.text,
    this.focusNode,
    this.nextFocus,
  });

  @override
  Widget build(BuildContext context) {
    return _handleRenderTextInputDefault(context);
  }

  Container _handleRenderTextInputDefault(context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: TextFormField(
        controller: controller,
        obscureText: password,
        validator: validator,
        focusNode: focusNode,
        textInputAction: actionTextInput,
        keyboardType: textInputType,
        decoration: InputDecoration(
            labelText: label,
            hintText: hint,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
        onFieldSubmitted: (String value) {
          if (nextFocus != null) FocusScope.of(context).requestFocus(nextFocus);
        },
      ),
    );
  }
}
