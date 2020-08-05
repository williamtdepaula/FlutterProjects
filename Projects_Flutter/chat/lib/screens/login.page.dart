import 'package:chat/blocs/login.bloc.dart';
import 'package:chat/components/buttons/button_likend.dart';
import 'package:chat/components/buttons/default_button.dart';
import 'package:chat/components/image/logo.dart';
import 'package:chat/components/input/default_input.dart';
import 'package:chat/screens/registration.page.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static final String id = '/login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginBloc _loginBloc = new LoginBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _loginBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _handlerRenderBody(),
    );
  }

  _handlerRenderBody() {
    return GestureDetector(
      onTap: () => _loginBloc.closeKeyBoardWhenClickOff(context),
      child: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              Expanded(child: Hero(tag: 'logo', child: Logo())),
              Expanded(
                child: _handlerRenderForm(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _handlerRenderForm() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          DefaultInput(
            controller: _loginBloc.textEmailController,
            label: 'E-mail',
          ),
          DefaultInput(
            controller: _loginBloc.textPasswordController,
            label: 'Senha',
            password: true,
          ),
          StreamBuilder(
            stream: _loginBloc.stream,
            builder: (BuildContext context, snapshot) {
              return DefaultButton(
                onPress: () => _loginBloc.login(context),
                text: 'ENTRAR',
                loadingState: snapshot.data,
              );
            },
          ),
          ButtonLinked(
            text: 'NÃO TENHO CONTA',
            route: RegistrationScreen.id,
          ),
        ],
      ),
    );
  }
}
