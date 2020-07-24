class Weather {
  int weatherID;
  String cityName;
  double temp;

  Weather({this.weatherID, this.cityName, this.temp});

  get getTempInCelsius  => '${(this.temp.toInt())}º';
}
