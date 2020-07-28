import 'package:chat/components/buttons/default_button.dart';
import 'package:chat/components/image/logo.dart';
import 'package:chat/screens/login_screen.dart';
import 'package:chat/screens/registration_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  static final String id = '/';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  onPressSignIn() {
    Navigator.pushNamed(context, LoginScreen.id);
  }

  onPressSignUp() {
    Navigator.pushNamed(context, RegistrationScreen.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _handlerRenderBody(),
    );
  }

  SafeArea _handlerRenderBody() {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(child: Logo()),
            Expanded(child: _handlerRenderButtons()),
          ],
        ),
      ),
    );
  }
  
  _handlerRenderButtons() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        DefaultButton(
          onPress: onPressSignIn,
          text: 'Entrar',
        ),
        DefaultButton(
          onPress: onPressSignUp,
          text: 'Registrar-se',
          buttonColor: Colors.white,
          elevation: 0,
          textColor: Colors.green,
        ),
      ],
    );
  }
}
