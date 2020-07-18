import 'package:bmi_calculator/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/widget/circle_button.dart';

class MoreLessCard extends StatefulWidget {
  final String title;
  final Function onValueChanged;

  MoreLessCard({@required this.title, @required this.onValueChanged});

  @override
  _MoreLessCardState createState() => _MoreLessCardState();
}

class _MoreLessCardState extends State<MoreLessCard> {
  int value = 60;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  add() {
    this.setState(() {
      value++;
    });
  }

  remove() {
    this.setState(() {
      value--;
    });
  }

  pressOnButton(CircleButtonAddOrRemoveType type) {
    this.setState(() {
      type == CircleButtonAddOrRemoveType.remove ? value-- : value++;
    });
    widget.onValueChanged(value);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          widget.title,
          style: kLabelTextStyle,
        ),
        Text(
          value.toString(),
          style: TextStyle(
              color: Colors.white, fontSize: 40, fontWeight: FontWeight.w900),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleButtonAddOrRemove(
              type: CircleButtonAddOrRemoveType.remove,
              onTap: () => pressOnButton(CircleButtonAddOrRemoveType.remove),
            ),
            SizedBox(width: 20),
            CircleButtonAddOrRemove(
              type: CircleButtonAddOrRemoveType.add,
              onTap: () => pressOnButton(CircleButtonAddOrRemoveType.add),
            )
          ],
        ),
      ],
    );
  }
}
