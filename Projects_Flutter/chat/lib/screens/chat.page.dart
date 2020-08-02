import 'package:chat/blocs/chat.bloc.dart';
import 'package:chat/components/bubble/bubble.dart';
import 'package:chat/components/input/input_chat.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  static final String id = '/chat';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  ChatBloc _chatBloc = new ChatBloc();

  @override
  void initState() {
    super.initState();

    _chatBloc.listener();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _chatBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
        backgroundColor: Colors.green,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.close,
              color: Colors.white,
            ),
            onPressed: () => _chatBloc.logout(context),
          ),
        ],
      ),
      body: _handlerRenderBody(),
    );
  }

  _handlerRenderBody() {
    return SafeArea(
      child: Column(
        children: <Widget>[
          Expanded(child: _handleRenderChatContent()),
          _handlerRenderInput(),
        ],
      ),
    );
  }

  _handleRenderChatContent() {
    return StreamBuilder(
        stream: _chatBloc.stream,
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, index) {
                return Bubble(message: snapshot.data[index], );
              },
            );
          }
          return Container();
        });
  }

  _handlerRenderInput() {
    return InputChat(
      onPress: (message) => _chatBloc.sendMessage(message),
    );
  }
}
