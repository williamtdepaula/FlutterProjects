import 'dart:convert';

import 'package:clima/common.dart';
import 'package:clima/models/Location.dart';
import 'package:clima/models/Weather.dart';
import 'package:http/http.dart';

class Network {
  Future<Weather> getWeatherByLatAndLong(Location location) async {
    print('Buscando temperatura por localização');

    Response response = await get(
        'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$WEATHER_API_KEY&units=metric');

    Map<String, dynamic> responseMap = json.decode(response.body);

    Location coord = new Location(
      latitude: responseMap['coord']['lat'],
      longitude: responseMap['coord']['lon'],
    );
    double temp = responseMap['main']['temp'];
    int weatherID = responseMap['weather'][0]['id'];
    String cityName = responseMap['name'];

    return Weather(
      weatherID: weatherID,
      temp: temp,
      cityName: cityName,
      location: coord,
    );
  }

  Future<Weather> getWeatherByCityName(String city) async {
    print('Buscando temperatura pelo nome da cidade');

    Response response = await get(
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$WEATHER_API_KEY&units=metric');

    Map<String, dynamic> responseMap = json.decode(response.body);

    Location location = new Location(
      latitude: responseMap['coord']['lat'],
      longitude: responseMap['coord']['lon'],
    );

    double temp = responseMap['main']['temp'].toDouble();
    int weatherID = responseMap['weather'][0]['id'].toInt();
    String cityName = responseMap['name'].toString();

    return Weather(
      weatherID: weatherID,
      temp: temp,
      cityName: cityName,
      location: location,
      date: DateTime.now(),
    );
  }

  Future<List<Weather>> getWeatherForecast(Location location) async {
    print('Buscando previsão');

    Response response = await get(
        'https://api.openweathermap.org/data/2.5/onecall?lat=${location.latitude}&lon=${location.longitude}&appid=$WEATHER_API_KEY&units=metric');

    Map<String, dynamic> responseMap = json.decode(response.body);

    List<Weather> weathers = [];

    responseMap['daily'].asMap().forEach((index, daily) {
      if (index > 0) {
        Weather weather = new Weather(
          date: DateTime.fromMillisecondsSinceEpoch(daily['dt'] * 1000),
          temp: daily['temp']['day'],
          location: location,
        );

        weathers.add(weather);
      }
    });

    return weathers;
  }
}
