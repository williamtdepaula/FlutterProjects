
import 'dart:convert';

import 'package:clima/common.dart';
import 'package:clima/models/Weather.dart';
import 'package:http/http.dart' ;

class Network{
  Future<Weather> getWeather(double lat, double long) async {
     Response response = await get(
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=$WEATHER_API_KEY');

    Map<String, dynamic> responseMap = json.decode(response.body);

    double temp = responseMap['main']['temp'];
    int weatherID = responseMap['weather'][0]['id'];
    String cityName = responseMap['name'];

    return Weather(weatherID: weatherID, temp: temp, cityName: cityName);

  }
}