import 'package:flutter/material.dart';

mixin ScreenWithKeyBoard {
  void closeKeyBoardWhenClickOff(BuildContext context) {
    FocusScopeNode focusScopeNode = FocusScope.of(context);

    if (!focusScopeNode.hasPrimaryFocus) {
      focusScopeNode.unfocus();
    }
  }
}
