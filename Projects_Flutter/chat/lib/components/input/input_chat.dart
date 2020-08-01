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
      padding: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 6,
            child: TextFormField(
              controller: textEditingController,
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.green)),
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.green),
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
