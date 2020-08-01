import 'package:chat/blocs/registration.bloc.dart';
import 'package:chat/components/buttons/default_button.dart';
import 'package:chat/components/image/logo.dart';
import 'package:chat/components/input/default_input.dart';
import 'package:chat/models/loading.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  static final String id = '/registration';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  RegistrationBloc _registrationBloc = new RegistrationBloc();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _registrationBloc.dispose();
  }

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
          type: TextInputType.emailAddress,
          controller: _registrationBloc.textEmailController,
          label: 'E-mail',
        ),
        DefaultInput(
          controller: _registrationBloc.textPasswordController,
          label: 'Senha',
          password: true,
        ),
        StreamBuilder(
          stream: _registrationBloc.stream,
          builder: (BuildContext context, snapshot) {
            return DefaultButton(
              onPress: () => _registrationBloc.register(context),
              text: 'REGISTRAR-SE',
              loadingState: snapshot.data,
            );
          },
        ),
      ],
    );
  }
}
