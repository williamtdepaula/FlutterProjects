import 'dart:convert';

import 'package:chat/components/bubble/bubble.dart';
import 'package:chat/models/UserMessage.dart';
import 'package:chat/models/message.dart';
import 'package:chat/models/simpleStream.dart';
import 'package:chat/screens/welcome.page.dart';
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

    Navigator.pushReplacementNamed(context, WelcomeScreen.id);
  }

  sendMessage(message) async {
    if (message != '') {
      await firestore.collection('messages').add({
        "text": message,
        "sender": userLogged.email,
        "name": userLogged.displayName,
        "createdAt": new DateTime.now().millisecondsSinceEpoch,
      });
    }
  }

  listener() {
    firestore
        .collection('messages')
        .orderBy('createdAt', descending: true)
        .snapshots()
        .listen((event) {
      List<Message> messages = [];

      event.documents.forEach((changes) {
        final UserMessage userMessage = new UserMessage(
            email: changes.data['sender'], name: changes.data['name']);

        Message message = new Message(
          id: changes.documentID,
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
