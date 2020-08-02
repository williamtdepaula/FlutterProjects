import 'package:chat/models/loading.dart';
import 'package:chat/models/simpleStream.dart';
import 'package:chat/models/userLogged.dart';
import 'package:chat/screens/chat.page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginBloc extends SimpleStream<LoadingState> {
  TextEditingController textEmailController = new TextEditingController();
  TextEditingController textPasswordController = new TextEditingController();

  FirebaseAuth fireAuth = FirebaseAuth.instance;

  login(BuildContext context) async {
    addToStream(LoadingState.loading);

    final String email = textEmailController.value.text;
    final String password = textPasswordController.value.text;

    print('TO LOGIN $email $password');

    await fireAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    UserLogged user = new UserLogged(email: email, password: password);

    user.saveUserLocal();

    addToStream(LoadingState.notLoading);

    Navigator.pushReplacementNamed(context, ChatScreen.id);
  }
}
