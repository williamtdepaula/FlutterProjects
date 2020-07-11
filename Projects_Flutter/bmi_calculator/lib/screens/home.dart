import 'package:bmi_calculator/widget/Height_card.dart';
import 'package:bmi_calculator/widget/half_card_sex.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Hello')),
      ),
      body: _handlerRenderBody(),
      
    );
  }

  _handlerRenderBody() {
    return Column(
      children: <Widget>[
        Expanded(child: _handleRenderFirstRow()),
        HalfCardSex(),
        Expanded(child: _handleRenderFirstRow()),
      ],
    );
  }

  _handleRenderFirstRow() {
    return Row(
      children: <Widget>[HalfCardSex(), HalfCardSex()],
    );
  }
}
