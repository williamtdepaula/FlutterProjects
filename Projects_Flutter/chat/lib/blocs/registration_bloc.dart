import 'package:flutter/material.dart';

class RegistrationBloc {
  TextEditingController textEmailController = new TextEditingController();
  TextEditingController textPasswordController = new TextEditingController();

  register() {
    print(textEmailController.value.text);
    print(textPasswordController.value.text);
  }
}
