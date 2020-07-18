import 'package:bmi_calculator/utils/constants.dart';
import 'package:flutter/material.dart';

class HeightCard extends StatefulWidget {
  Function onEndSlide;

  HeightCard({this.onEndSlide});

  @override
  _HeightCardState createState() => _HeightCardState();
}

class _HeightCardState extends State<HeightCard> {
  int height = 180;

  @override
  void initState() {
    super.initState();
  }

  void onChangeHeight(double _height) {
    setState(() {
      height = _height.toInt();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'HEIGHT',
          style: kLabelTextStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: <Widget>[
            Text(
              height.toString(),
              style: kStyleTextNumber,
            ),
            Text(
              'cm',
              style: TextStyle(
                fontSize: 20,
                color: kColorText,
              ),
            ),
          ],
        ),
        SliderTheme(
          //Pega o tema atual, que está no contexto "SliderTheme.of(context)" e muda apenas o que precisa com "copyWith"
          data: SliderTheme.of(context).copyWith(
            thumbColor: Color(0xFFEB1555),
            overlayColor: Color(0x30EB1555),
            activeTrackColor: Colors.white,
            inactiveTrackColor: Color(0xFF8D8E98),
            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
            overlayShape: RoundSliderOverlayShape(overlayRadius: 30)
          ),
          child: Slider(
            value: height.toDouble(),
            min: 120.0,
            max: 220.0,
            onChanged: onChangeHeight,
            onChangeEnd: widget.onEndSlide,
          ),
        ),
      ],
    );
  }
}
