import 'package:chat/components/bubble/bubble.dart';
import 'package:chat/models/UserMessage.dart';
import 'package:chat/models/message.dart';
import 'package:chat/models/simpleStream.dart';
import 'package:chat/utils/Prefs.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatBloc extends SimpleStream<List<Message>> {
  FirebaseAuth fireAuth = FirebaseAuth.instance;
  Firestore firestore = Firestore.instance;
  FirebaseUser userLogged;

  ChatBloc() {
    Future<FirebaseUser> user = fireAuth.currentUser();

    user.then((value) => {userLogged = value});
  }

  logout(context) async {
    await fireAuth.signOut();

    Prefs.setString('user', '');

    Navigator.pop(context);
  }

  sendMessage(message) async {
    await firestore.collection('messages').add({
      "text": message,
      "sender": userLogged.email,
    });
  }

  listener() {
    firestore.collection('messages').snapshots().listen((event) {
      List<Message> messages = [];
      
      event.documents.forEach((changes) {
        final UserMessage userMessage =
            new UserMessage(email: changes.data['sender']);

        Message message = new Message(
          text: changes.data['text'],
          user: userMessage,
          position: userLogged.email == userMessage.email
              ? BubblePosition.right
              : BubblePosition.left,
        );

        messages.add(message);

        addToStream(messages);
      });
    });
  }
}
