import 'package:bmi_calculator/models/Gender.dart';
import 'package:bmi_calculator/widget/male_or_famale_card.dart';
import 'package:bmi_calculator/widget/reusableCard.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const inactiveCardColor = Color(0xFF111328);
const activeCardColor = Color(0xFF1D1E33);

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Gender genderSelected;

  @override
  void initState() {
    super.initState();
  }

  onTapInGenderCard(Gender gender) {
    setState(() {
      genderSelected = gender;
    });
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
        ReusableCard(),
        Expanded(child: _handleRenderSecondRow()),
        _handlerRenderButton(),
      ],
    );
  }

  _handleRenderFirstRow() {
    return Row(
      children: <Widget>[
        ReusableCard(
          onTapCard: () => onTapInGenderCard(Gender.male),
          colorOfCard: genderSelected == Gender.male
              ? activeCardColor
              : inactiveCardColor,
          childCard: MaleOrFemaleCard(
            iconName: FontAwesomeIcons.mars,
            text: 'MALE',
          ),
        ),
        ReusableCard(
          onTapCard: () => onTapInGenderCard(Gender.female),
          colorOfCard: genderSelected == Gender.female
              ? activeCardColor
              : inactiveCardColor,
          childCard: MaleOrFemaleCard(
            iconName: FontAwesomeIcons.venus,
            text: 'FEMALE',
          ),
        ),
      ],
    );
  }

  _handleRenderSecondRow() {
    return Row(
      children: <Widget>[ReusableCard(), ReusableCard()],
    );
  }

  _handlerRenderButton() {
    return Container(
        color: Color(0xFFEB1555),
        margin: EdgeInsets.only(top: 10),
        width: double.infinity,
        height: 80);
  }
}
