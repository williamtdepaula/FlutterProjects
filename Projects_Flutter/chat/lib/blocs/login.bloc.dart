import 'package:chat/models/loading.dart';
import 'package:chat/models/simpleStream.dart';
import 'package:chat/screens/chat.page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginBloc extends SimpleStream<LoadingState> {
  TextEditingController textEmailController = new TextEditingController();
  TextEditingController textPasswordController = new TextEditingController();

  FirebaseAuth fireAuth = FirebaseAuth.instance;

  login(BuildContext context) async {
    addToStream(LoadingState.loading);

    await fireAuth.signInWithEmailAndPassword(
      email: textEmailController.value.text,
      password: textPasswordController.value.text,
    );

    addToStream(LoadingState.notLoading);

    Navigator.pushReplacementNamed(context, ChatScreen.id);
  }
}
