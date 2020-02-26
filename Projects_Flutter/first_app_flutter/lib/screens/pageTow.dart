import 'package:flutter/material.dart';
import '../components/Buttons/buttonDefault.dart';
import '../utils/Helper.dart';

class PageTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('PageTwo'),
      ),
      body: _handleRenderBody(context),
    );
  }

  Center _handleRenderBody(BuildContext context){
    return Center(
      child: ButtonDefault('Voltar', () => Helper.popNavigator(context, params: 'Voltando a tela')),
    );
  }
}
