import 'package:flutter/material.dart';

class ButtonDefault extends StatelessWidget {
  String textButton;
  Function onPress;
  bool showProgress;

  ButtonDefault(this.textButton,
      {@required this.onPress = null, this.showProgress = false});

  @override
  Widget build(BuildContext context) {
    return _handleRenderButtonDefault();
  }

  Container _handleRenderButtonDefault() {
    return Container(
      width: 300,
      child: RaisedButton(
        color: Colors.blue,
        child: showProgress
            ? Container(
              height: 20,
              width: 20,
              child:Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.white),
                ),
              ),)
            : Text(textButton,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
        onPressed: () => onPress(),
      ),
    );
  }
}
