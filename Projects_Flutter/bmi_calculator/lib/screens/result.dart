import 'package:bmi_calculator/widget/LargeButton.dart';
import 'package:bmi_calculator/widget/reusable_card.dart';
import 'package:flutter/material.dart';

class Result extends StatefulWidget {
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

  Text _rendlerRenderTitle() {
    return Text(
      'Your result',
      style: TextStyle(
        fontWeight: FontWeight.w900,
        fontSize: 50,
      ),
    );
  }

  ReusableCard _rendlerRenderContent() {
    return ReusableCard(
      childCard: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'NORMAL',
            style: TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.w900,
              fontSize: 20,
            ),
          ),
          SizedBox(
            height: 120,
          ),
          Text(
            '22.1',
            style: TextStyle(
              fontSize: 80,
              fontWeight: FontWeight.w900,
            ),
          ),
          SizedBox(
            height: 120,
          ),
          //Text('Normal BMI range'),
          //Text('18,5 - 25/kg m2'),
          Text(
            'You have a normal body wight, Good job!',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          //Text('Save Result')
        ],
      ),
    );
  }

  LargeButton _rendlerRenderButton() {
    return LargeButton(
      onTap: () => null,
      text: 'CALCULATE AGAIN',
    );
  }
}
