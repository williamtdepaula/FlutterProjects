import 'package:clima/models/Location.dart';
import 'package:clima/models/Weather.dart';
import 'package:clima/services/Network.dart';

class LocationScreenBloc {
  Future<Weather> getWeatherByLatAndLong() async {
    Location location = new Location();

    await location.getLocation();

    Weather weather = await Network()
        .getWeatherByLatAndLong(location.latitude, location.longitude);

    return weather;
  }

  Future<Weather> getWeatherByCityName(String cityName) async {
    Weather weather = await Network().getWeatherByCityName(cityName);

    return weather;
  }
}
