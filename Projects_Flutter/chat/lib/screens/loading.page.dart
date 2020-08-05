import 'package:chat/models/userLogged.dart';
import 'package:chat/screens/chat.page.dart';
import 'package:chat/screens/welcome.page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  static final id = '/loading';

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  FirebaseAuth fireAuth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();

    autoLogin(context);
  }

  autoLogin(context) async {
    final UserLogged user = await UserLogged.getUserLocal();

    if (user != null) {
      await fireAuth.signInWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );
      Navigator.pushNamedAndRemoveUntil(context, ChatScreen.id, (_) => false);
    } else {
      Navigator.pushNamedAndRemoveUntil(context, WelcomeScreen.id, (_) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(Colors.green),
        ),
      ),
    );
  }
}
