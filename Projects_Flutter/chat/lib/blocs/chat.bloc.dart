import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatBloc {
  FirebaseAuth fireAuth = FirebaseAuth.instance;
  Firestore firestore = Firestore.instance;
  FirebaseUser userLogged;

  ChatBloc() {
    Future<FirebaseUser> user = fireAuth.currentUser();

    user.then((value) => {userLogged = value});
  }

  logout(context) async {
    await fireAuth.signOut();

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
      event.documentChanges.forEach((document) {
        print('documentChanges ${document.document.data}');
      });
    });
  }
}
