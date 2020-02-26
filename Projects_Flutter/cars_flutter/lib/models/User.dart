import 'package:cars_flutter/utils/Helper.dart';

class User{
  int id;
  String login;
  String nome;
  String email;
  String urlFoto;
  String token;
  List<String> roles;

  User(Map<String, dynamic> map){
    this.id = map['id'];
    this.login = map['login'];
    this.nome = map['nome'];
    this.email = map['email'];
    this.urlFoto = map['urlFoto'];
    this.token = map['token'];
    this.roles = Helper.convertDynamicListToStringList(map['roles']);//Convertendo uma lista do tipo DYNAMIC para lista do tipo STRING
  }

}