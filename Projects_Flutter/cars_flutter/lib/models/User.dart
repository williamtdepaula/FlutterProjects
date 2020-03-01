import 'dart:convert';

import 'package:cars_flutter/utils/Helper.dart';
import 'package:cars_flutter/utils/Prefs.dart';

class User {
  int id;
  String login;
  String nome;
  String email;
  String urlFoto;
  String token;
  List<String> roles;

  User(Map<String, dynamic> map) {
    this.id = map['id'];
    this.login = map['login'];
    this.nome = map['nome'];
    this.email = map['email'];
    this.urlFoto = map['urlFoto'];
    this.token = map['token'];
    this.roles = Helper.convertDynamicListToStringList(map[
        'roles']); //Convertendo uma lista do tipo DYNAMIC para lista do tipo STRING
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['login'] = this.login;
    data['nome'] = this.nome;
    data['email'] = this.email;
    data['urlFoto'] = this.urlFoto;
    data['token'] = this.token;
    data['roles'] = this.roles;
    return data;
  }

  void saveUserOnPreferences() {
    Map userMap = this.toMap();

    String userJSON = json.encode(userMap);

    Prefs.setString('user.data', userJSON);

  }

  static void clearUserOnPreferences(){
    Prefs.setString('user.data', '');
  }

  static Future<User> getUserFromPreferences() async {
    String userFromPreferences = await await Prefs.getString('user.data');

    if(userFromPreferences.isEmpty) return null;

    Map userMap = json.decode(userFromPreferences);//Pego o json do banco e transformo para Map(Objeto do JS)
    
    return User(userMap);//Crio um objeto do dart
  }

}

