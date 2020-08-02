import 'dart:convert';

import 'package:chat/models/user.dart';
import 'package:chat/utils/Prefs.dart';

class UserLogged extends User {
  String password;

  UserLogged({String email, this.password}) : super(email: email);//Criando a variável email e passando ela para a classe abstrata User

  UserLogged.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }

  void saveUserLocal() {
    Prefs.setString('user', json.encode(toMap()));
  }

  static Future<UserLogged> getUserLocal() async {
    final userLocal = await Prefs.getString('user');

    return userLocal.length > 0
        ? UserLogged.fromJson(json.decode(userLocal))
        : null;
  }
}
