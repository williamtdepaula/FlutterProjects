import 'package:chat/components/bubble/bubble.dart';
import 'package:chat/models/UserMessage.dart';

class Message{
  String id;
  String text;
  UserMessage user;
  BubblePosition position;

  Message({this.id, this.text, this.user, this.position = BubblePosition.left});
}