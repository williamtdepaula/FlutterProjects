import 'package:clima/models/Location.dart';
import 'package:clima/models/Weather.dart';
import 'package:clima/services/Network.dart';

class LocationScreenBloc {
  Weather currentWeather;

  Future<Weather> getWeatherByLatAndLong() async {
    Location location = new Location();

    await location.getLocation();

    Weather weather = await Network().getWeatherByLatAndLong(location);

    this.currentWeather = weather;

    return weather;
  }

  Future<Weather> getWeatherByCityName(String cityName) async {
    Weather weather = await Network().getWeatherByCityName(cityName);

    print('CITY ${weather.location.latitude}');

    this.currentWeather = weather;
    print('CITY AFTER ${currentWeather.location.latitude}');

    return weather;
  }

  Future<List<Weather>> getDailyDetails() async {

    print("Lat ${this.currentWeather.location.latitude}");

    List<Weather> weathers = await Network().getWeatherForecast(this.currentWeather.location);

    return weathers;
  }
}
