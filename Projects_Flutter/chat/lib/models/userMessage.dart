import 'package:chat/models/user.dart';

class UserMessage extends User{
  String name;

  UserMessage({String email, this.name}) : super(email: email);
}