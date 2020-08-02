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

    print('${user}');

    if (user != null) {
      await fireAuth.signInWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );

      Navigator.pushReplacementNamed(context, ChatScreen.id);
    } else {
    print('Enterded');
      Navigator.pushReplacementNamed(context, WelcomeScreen.id);
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
