import 'dart:async';

import 'package:chat/models/loading.dart';
import 'package:chat/models/simpleStream.dart';
import 'package:chat/screens/chat.page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegistrationBloc extends SimpleStream<LoadingState> {
  TextEditingController textEmailController = new TextEditingController();
  TextEditingController textPasswordController = new TextEditingController();

  final fireAuth = FirebaseAuth.instance;

  register(BuildContext context) async {
    try {
      addToStream(LoadingState.loading);

      await fireAuth.createUserWithEmailAndPassword(
        email: textEmailController.value.text,
        password: textPasswordController.value.text,
      );

      addToStream(LoadingState.notLoading);

      Navigator.pushReplacementNamed(context, ChatScreen.id);
    } catch (e) {
      print('Error register $e');
    }
  }
}
