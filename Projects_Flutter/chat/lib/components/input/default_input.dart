import 'package:flutter/material.dart';

class DefaultInput extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType type;
  final String label;
  final bool password;

  DefaultInput({@required this.controller, this.type = TextInputType.text, this.label = '', this.password = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      child: TextFormField(
        controller: controller,
        keyboardType: type,
        cursorColor: Colors.green,
        obscureText: password,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.black),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green),
            borderRadius: BorderRadius.circular(20),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
