import 'package:flutter/material.dart';

class LoginBloc {
  TextEditingController textEmailController = new TextEditingController();
  TextEditingController textPasswordController = new TextEditingController();

  login() {
    print(textEmailController.value.text);
    print(textPasswordController.value.text);
  }
}
