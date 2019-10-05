import 'package:flutter/material.dart';
import 'package:primero_app_flutter/utils/Helper.dart';
import 'package:primero_app_flutter/widgets/Buttons/button_blue.dart';

class Hello_page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 2'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: _renderBody(context),
    );
  }

  _renderBody(context) {
    return Center(
      child: BlueButton('Voltar a tela', onPressed: () => _onPressed(context)),
    );
  }

  _onPressed(context) {
    pop(context, 'Texto da tela 2');
  }
}
