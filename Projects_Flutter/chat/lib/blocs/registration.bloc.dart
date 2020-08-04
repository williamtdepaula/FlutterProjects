import 'dart:async';

import 'package:chat/models/keyboard_page.dart';
import 'package:chat/models/loading.dart';
import 'package:chat/models/simpleStream.dart';
import 'package:chat/models/user.dart';
import 'package:chat/models/userLogged.dart';
import 'package:chat/screens/chat.page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegistrationBloc extends SimpleStream<LoadingState>
    with ScreenWithKeyBoard {
  TextEditingController textEmailController = new TextEditingController();
  TextEditingController textPasswordController = new TextEditingController();
  TextEditingController textNameController = new TextEditingController();

  final fireAuth = FirebaseAuth.instance;

  register(BuildContext context) async {
    try {
      addToStream(LoadingState.loading);

      final String email = textEmailController.value.text;
      final String password = textPasswordController.value.text;

      AuthResult authResult = await fireAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      FirebaseUser userFire = authResult.user;

      UserUpdateInfo userUpdateInfo = new UserUpdateInfo();

      userUpdateInfo.displayName = textNameController.value.text;

      await userFire.updateProfile(userUpdateInfo);

      UserLogged user = new UserLogged(email: email, password: password);

      user.saveUserLocal();

      addToStream(LoadingState.notLoading);

      Navigator.pushReplacementNamed(context, ChatScreen.id);
    } catch (e) {
      print('Error register $e');
    }
  }
}
