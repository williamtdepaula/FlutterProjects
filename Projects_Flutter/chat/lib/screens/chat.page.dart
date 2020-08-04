import 'package:chat/blocs/chat.bloc.dart';
import 'package:chat/components/bubble/bubble.dart';
import 'package:chat/components/input/input_chat.dart';
import 'package:chat/models/keyboard_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  static final String id = '/chat';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> with ScreenWithKeyBoard {
  ChatBloc _chatBloc = new ChatBloc();

  @override
  void initState() {
    super.initState();

    _chatBloc.listener();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _chatBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => closeKeyBoardWhenClickOff(context),
      child: Scaffold(
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
      ),
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
              controller: _chatBloc.scrollController,
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, index) {
                return Bubble(
                  message: snapshot.data[index],
                );
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
