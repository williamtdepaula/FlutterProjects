import 'package:flutter/material.dart';

class InputChat extends StatelessWidget {
  final TextEditingController textEditingController =
      new TextEditingController();

  final Function onPress;

  InputChat({@required this.onPress});

  void send() {
    onPress(textEditingController.value.text);

    textEditingController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(top: BorderSide(width: 2, color: Colors.green)),
      ),
      padding: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 6,
            child: TextFormField(
              maxLines: null,
              controller: textEditingController,
              decoration: InputDecoration(
                hintText: 'Digite uma mensagem...',
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(style: BorderStyle.none),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(style: BorderStyle.none),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              child: RawMaterialButton(
                onPressed: send,
                shape: CircleBorder(),
                fillColor: Colors.green,
                child: Icon(Icons.send, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
