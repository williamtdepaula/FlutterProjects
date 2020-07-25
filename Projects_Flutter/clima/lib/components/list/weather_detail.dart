import 'package:clima/models/Weather.dart';
import 'package:clima/utils/constants.dart';
import 'package:flutter/material.dart';

class WeatherDetail extends StatelessWidget {
  final Weather weather;

  WeatherDetail({this.weather});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            weather.dateDescription(),
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          Text(
            weather.getTempInCelsius,
          ),
        ],
      ),
    );
  }
}
