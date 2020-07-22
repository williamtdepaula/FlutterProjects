import 'dart:convert';

import 'package:clima/common.dart';
import 'package:clima/models/Location.dart';
import 'package:clima/models/Weather.dart';
import 'package:clima/services/Network.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    super.initState();

    getLocation();
  }

  void getLocation() async {
    Location location = new Location();

    await location.getLocation();

    Weather weather = await Network().getWeather(location.latitude, location.longitude);

    print('${weather.temp.toString()} ${weather.weatherID.toString()} ${weather.cityName.toString()}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _rendlerRenderBody(),
    );
  }

  Center _rendlerRenderBody() {
    return Center();
  }
}
