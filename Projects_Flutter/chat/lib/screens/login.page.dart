import 'package:chat/blocs/login.bloc.dart';
import 'package:chat/components/buttons/default_button.dart';
import 'package:chat/components/image/logo.dart';
import 'package:chat/components/input/default_input.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static final String id = '/login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginBloc _loginBloc = new LoginBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _handlerRenderBody(),
    );
  }

  _handlerRenderBody() {
    return SafeArea(
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
    );
  }

  _handlerRenderForm() {
    return Column(
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
            }),
      ],
    );
  }
}
