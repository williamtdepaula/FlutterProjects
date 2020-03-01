import 'dart:async';

import 'package:cars_flutter/models/ApiResponse.dart';
import 'package:cars_flutter/models/LoginBloc.dart';
import 'package:cars_flutter/models/User.dart';
import 'package:cars_flutter/screens/homePage.dart';
import 'package:cars_flutter/utils/Api.dart';
import 'package:cars_flutter/utils/Helper.dart';
import 'package:cars_flutter/widgets/Buttons/buttonDefault.dart';
import 'package:flutter/material.dart';
import '../widgets/textInputs/textInputDefault.dart';
import '../utils/Validator.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final keyFormLogin = GlobalKey<FormState>();
  final loginTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final focusPassword = FocusNode();

  LoginBloc _blocLogin = LoginBloc();

  bool loading = false;

  @override
  void initState() {
    super.initState(); //Consigo pegar o conexto em qualquer parte dessa classe

    Future<User> userFuture = User.getUserFromPreferences();

    userFuture.then((user) {
      if (user != null) {
        Helper.pushNavigator(context, HomePage(), replace: true);

        /*setState(() {
          loginTextController.text = user.nome;
        });*/
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _handleRenderBody(),
    );
  }

  _handleRenderBody() {
    return SafeArea(
      child: Form(
        key: keyFormLogin,
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              TextInputDefault(
                'Login',
                'Digite seu login',
                controller: loginTextController,
                validator: (String value) => Validator.validateLogin(value),
                actionTextInput: TextInputAction.next,
                textInputType: TextInputType.emailAddress,
                nextFocus: focusPassword,
              ),
              TextInputDefault(
                'Senha',
                '*********',
                controller: passwordTextController,
                password: true,
                validator: (String value) => Validator.validatePassword(value),
                textInputType: TextInputType.number,
                focusNode: focusPassword,
              ),
              StreamBuilder<bool>(
                  stream: _blocLogin.buttonBloc.stream,
                  initialData: false, //Qual valor deve começar a snapshot
                  builder: (context, snapShot) {
                    return ButtonDefault(
                      'Logar',
                      onPress: () => _tryLogin(),
                      showProgress: snapShot.data,
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }

  _tryLogin() async {
    if (!(keyFormLogin.currentState.validate())) {
      //Chama o validador de todos os campos TextFormField
      return; //Não faz nada
    }

    ApiResponse responseUserLogin = await _blocLogin.loginUser(
        loginTextController.text, passwordTextController.text);

    if (responseUserLogin.ok) {
      //Se estiver ok deu certo o login
      User user = responseUserLogin.result;
      print('User > $user');
      Helper.pushNavigator(context, HomePage(), replace: true);
    } else {
      //Caso não esteja ok
      Helper.alert(context, content: Text(responseUserLogin.msg));
      print('Error > ${responseUserLogin.msg}');
    }
  }

  @override
  void dispose() {
    //O mesmo que componetWillUnmout()
    // TODO: implement dispose
    super.dispose();

    _blocLogin.buttonBloc.clearStream();
  }
}
