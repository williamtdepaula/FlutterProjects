import 'dart:convert';

import 'package:chat/components/bubble/bubble.dart';
import 'package:chat/models/message.dart';
import 'package:chat/utils/Helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BubbleBloc {
  final Firestore _firestore = Firestore.instance;

  void onLongPress(BuildContext context, Message message) {
    if (message.position == BubblePosition.right) {
      Helper.alertDeleteMessage(context, (option) async {
        if (option == 1) {
          print('Delete');
          await _firestore.collection('messages').document(message.id).delete();
        }
      });
    }
  }
}
