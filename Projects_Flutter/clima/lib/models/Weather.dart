import 'package:clima/models/Day.dart';
import 'package:clima/models/Location.dart';
import 'package:clima/utils/Helper.dart';

class Weather {
  int weatherID;
  String cityName;
  double temp;
  Location location;
  DateTime date;

  Weather({this.weatherID, this.cityName, this.temp, this.location, this.date});

  get getTempInCelsius => '${(this.temp.toInt())}º';

  String dateDescription() {
    DateTime today = new DateTime.now();
    DateTime tomorrow = new DateTime(today.year, today.month, today.day + 1);

    if (Helper.getOnlyDate(date) == Helper.getOnlyDate(tomorrow)) {
      return 'Amanhã';
    }
    return Day().atDay(date.weekday);
  }
}
