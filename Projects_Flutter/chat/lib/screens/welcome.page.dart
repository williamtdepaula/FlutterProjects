import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chat/components/buttons/default_button.dart';
import 'package:chat/components/image/logo.dart';
import 'package:chat/screens/login.page.dart';
import 'package:chat/screens/registration.page.dart';
import 'package:chat/utils/Helper.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  static final String id = '/';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation animation;

  @override
  void initState() {
    super.initState();

    animationController = new AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    animation =
        CurvedAnimation(parent: animationController, curve: Curves.elasticOut);

    animationController.forward();

    animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();

    animationController.dispose();
  }

  onPressSignIn() {
    Navigator.pushReplacementNamed(context, LoginScreen.id);
  }

  onPressSignUp() {
    Navigator.pushReplacementNamed(context, RegistrationScreen.id);
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
            Expanded(child: _handlerRenderTitle()),
            Expanded(child: _handlerRenderButtons()),
          ],
        ),
      ),
    );
  }

  _handlerRenderTitle() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Hero(
          tag: 'logo',
          child: Logo(
            size: animation.value * 60,
          ),
        ),
        ColorizeAnimatedTextKit(
          text: [
            'Flash Chat',
            'Your Chat'
          ],
          colors: [
            Colors.green,
            Colors.blue,
          ],
          textStyle: TextStyle(
              color: Colors.green, fontSize: 45, fontWeight: FontWeight.w900),
        ),
      ],
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
