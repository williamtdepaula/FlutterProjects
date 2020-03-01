import 'dart:async';

import 'package:cars_flutter/models/ApiResponse.dart';
import 'package:cars_flutter/models/SimpleBloc.dart';
import 'package:cars_flutter/models/User.dart';
import 'package:cars_flutter/utils/Api.dart';

class LoginBloc{

  SimpleBloc buttonBloc = SimpleBloc<bool>();//Caso haja várias streams

  Future<ApiResponse> loginUser(String login, String password) async {
    buttonBloc.add(true);

    ApiResponse response = await Api.login(login, password);

    buttonBloc.add(false);

    return response;
  }
}
