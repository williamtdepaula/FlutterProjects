import 'package:chat/components/bubble/bubble.dart';
import 'package:chat/models/UserMessage.dart';

class Message{
  String text;
  UserMessage user;
  BubblePosition position;

  Message({this.text, this.user, this.position = BubblePosition.left});
}