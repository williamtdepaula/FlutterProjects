import 'package:chat/blocs/registration_bloc.dart';
import 'package:chat/components/buttons/default_button.dart';
import 'package:chat/components/image/logo.dart';
import 'package:chat/components/input/default_input.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  static final String id = '/registration';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  RegistrationBloc _registrationBloc = new RegistrationBloc();

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
            Expanded(child: Logo()),
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
          controller: _registrationBloc.textEmailController,
          label: 'E-mail',
        ),
        DefaultInput(
          controller: _registrationBloc.textPasswordController,
          label: 'Senha',
          password: true,
        ),
        DefaultButton(
          onPress: _registrationBloc.register,
          text: 'REGISTRAR-SE',
        )
      ],
    );
  }
}
