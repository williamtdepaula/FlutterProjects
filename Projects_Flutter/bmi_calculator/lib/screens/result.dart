import 'package:bmi_calculator/widget/LargeButton.dart';
import 'package:bmi_calculator/widget/reusable_card.dart';
import 'package:flutter/material.dart';

class Result extends StatefulWidget {
  String status;
  String interpretation;
  String result;

  Result({this.status, this.interpretation, this.result});

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: _rendlerRenderBody(),
    );
  }

  _rendlerRenderBody() {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _rendlerRenderTitle(),
          _rendlerRenderContent(),
          _rendlerRenderButton(),
        ],
      ),
    );
  }

  Padding _rendlerRenderTitle() {
    return Padding(
      padding: EdgeInsets.only(left: 10),
      child: Text(
        'Your result',
        style: TextStyle(
          fontWeight: FontWeight.w900,
          fontSize: 50,
        ),
      ),
    );
  }

  ReusableCard _rendlerRenderContent() {
    return ReusableCard(
      childCard: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            widget.status,
            style: TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.w900,
              fontSize: 20,
            ),
          ),
          Text(
            widget.result,
            style: TextStyle(
              fontSize: 80,
              fontWeight: FontWeight.w900,
            ),
          ),
          Text(
            widget.interpretation,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              
            ),
          ),
        ],
      ),
    );
  }

  LargeButton _rendlerRenderButton() {
    return LargeButton(
      onTap: () => Navigator.pop(context),
      text: 'RE-CALCULATE',
    );
  }
}
