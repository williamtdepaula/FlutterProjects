import 'dart:convert';

import 'package:clima/common.dart';
import 'package:clima/models/Weather.dart';
import 'package:http/http.dart';

class Network {
  Future<Weather> getWeatherByLatAndLong(double lat, double long) async {
    Response response = await get(
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=$WEATHER_API_KEY&units=metric');

    Map<String, dynamic> responseMap = json.decode(response.body);

    double temp = responseMap['main']['temp'];
    int weatherID = responseMap['weather'][0]['id'];
    String cityName = responseMap['name'];

    return Weather(weatherID: weatherID, temp: temp, cityName: cityName);
  }

  Future<Weather> getWeatherByCityName(String city) async {
    Response response = await get(
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$WEATHER_API_KEY&units=metric');

    Map<String, dynamic> responseMap = json.decode(response.body);

    double temp = responseMap['main']['temp'].toDouble();
    int weatherID = responseMap['weather'][0]['id'].toInt();
    String cityName = responseMap['name'].toString();

    return Weather(weatherID: weatherID, temp: temp, cityName: cityName);
  }
}
