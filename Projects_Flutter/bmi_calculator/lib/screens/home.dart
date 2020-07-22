import 'package:bmi_calculator/models/Calculate_brain.dart';
import 'package:bmi_calculator/models/Gender.dart';
import 'package:bmi_calculator/screens/result.dart';
import 'package:bmi_calculator/utils/constants.dart';
import 'package:bmi_calculator/widget/LargeButton.dart';
import 'package:bmi_calculator/widget/height_card.dart';
import 'package:bmi_calculator/widget/male_or_famale_card.dart';
import 'package:bmi_calculator/widget/more_less_card.dart';
import 'package:bmi_calculator/widget/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Gender genderSelected;
  int height = 120;
  int weight = 60;
  int age;

  @override
  void initState() {
    super.initState();
  }

  void onTapInGenderCard(Gender gender) {
    setState(() {
      genderSelected = gender;
    });
  }

  void pressToCalc() {
    CalculateBrain calculateBrain =
        new CalculateBrain(height: this.height, weight: this.weight);

    final String result = calculateBrain.calculateBMI();
    final String status = calculateBrain.getMessage;
    final String interpretation = calculateBrain.getInterpretation;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Result(
          interpretation: interpretation,
          result: result,
          status: status,
        ),
      ),
    );

    //Navigator.pushNamed(context, '/result', arguments: Result());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: _handlerRenderBody(),
    );
  }

  Column _handlerRenderBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(child: _handleRenderFirstRow()),
        ReusableCard(
          onTapCard: () => null,
          childCard: HeightCard(
            onEndSlide: (heightSelected) => height = heightSelected.toInt(),
          ),
        ),
        Expanded(child: _handleRenderSecondRow()),
        _handlerRenderButton(),
      ],
    );
  }

  Row _handleRenderFirstRow() {
    return Row(
      children: <Widget>[
        ReusableCard(
          onTapCard: () => onTapInGenderCard(Gender.male),
          colorOfCard: genderSelected == Gender.male
              ? kActiveCardColor
              : kInactiveCardColor,
          childCard: MaleOrFemaleCard(
            iconName: FontAwesomeIcons.mars,
            text: 'MALE',
          ),
        ),
        ReusableCard(
          onTapCard: () => onTapInGenderCard(Gender.female),
          colorOfCard: genderSelected == Gender.female
              ? kActiveCardColor
              : kInactiveCardColor,
          childCard: MaleOrFemaleCard(
            iconName: FontAwesomeIcons.venus,
            text: 'FEMALE',
          ),
        ),
      ],
    );
  }

  Row _handleRenderSecondRow() {
    return Row(
      children: <Widget>[
        ReusableCard(
          childCard: MoreLessCard(
            title: 'WEIGHT',
            onValueChanged: (int value) => weight = value,
          ),
        ),
        ReusableCard(
          childCard: MoreLessCard(
            title: 'AGE',
            onValueChanged: (int value) => age = value,
          ),
        ),
      ],
    );
  }

  LargeButton _handlerRenderButton() {
    return LargeButton(
      text: 'CALCULATE',
      onTap: pressToCalc,
    );
  }
}
