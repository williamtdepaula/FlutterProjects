import 'package:cars_flutter/models/ApiResponse.dart';
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
  final loginTextController = TextEditingController(text: 'admin');
  final passwordTextController = TextEditingController(text: '123');
  final focusPassword = FocusNode();

  bool loading = false;

  @override
  void initState() => super
      .initState(); //Consigo pegar o conexto em qualquer parte dessa classe

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
              ButtonDefault(
                'Logar',
                onPress: () => _tryLogin(),
                showProgress: loading,
              ),
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

    setState(() {
      loading = true;
    });

    ApiResponse responseUserLogin =
        await Api.login(loginTextController.text, passwordTextController.text);

    if (responseUserLogin.ok) {//Se estiver ok deu certo o login
      User user = responseUserLogin.result;
      print('User > $user');
      Helper.pushNavigator(context, HomePage(TypeCar.classics), replace: true);
    } else {//Caso não esteja ok
      Helper.alert(context, content: Text(responseUserLogin.msg));
      print('Error > ${responseUserLogin.msg}');
    }
    
    setState(() {
      loading = false;
    });
  }
}
