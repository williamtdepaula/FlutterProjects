import 'package:clima/components/list/weather_detail.dart';
import 'package:clima/components/loading.dart';
import 'package:clima/models/LocationScreenBloc.dart';
import 'package:clima/models/Weather.dart';
import 'package:clima/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';

class LocationScreen extends StatefulWidget {
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  final FocusNode inputFocusNode = new FocusNode();

  LocationScreenBloc _locationScreenBloc = new LocationScreenBloc();

  bool loading = true;
  bool showInput = false;
  Weather weather;
  String city;
  List<Weather> weathers;

  void onLoad() async {
    weather = await _locationScreenBloc.getWeatherByLatAndLong();

    await getWeatherDetails();

    setState(() {
      loading = false;
    });
  }

  void onPressFindButtom() async {
    if (!showInput) {
      setState(() {
        showInput = true;
      });

      inputFocusNode.requestFocus();

      initListeners();
    } else {
      await getCityWeather(city);
    }
  }

  void initListeners() {
    KeyboardVisibilityNotification().addNewListener(onChange: (focus) {
      setVisibilityInput(show: focus);
    });

    inputFocusNode.addListener(() {
      setVisibilityInput(show: inputFocusNode.hasFocus);
    });
  }

  Future<void> getWeatherDetails() async {
    weathers = await _locationScreenBloc.getDailyDetails();

    setState(() {
      weathers = weathers;
    });
  }

  Future<void> getCityWeather(String city) async {
    if (city.length > 0) {
      setState(() {
        loading = true;
      });

      weather = await _locationScreenBloc.getWeatherByCityName(city);

      await getWeatherDetails();

      setState(() {
        loading = false;
      });
    }
  }

  void setVisibilityInput({show = false}) {
    setState(() {
      showInput = show;
    });
  }

  @override
  void initState() {
    super.initState();

    onLoad();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _handlerRenderBody(),
      resizeToAvoidBottomInset: false,
    );
  }

  _handlerRenderBody() {
    return SafeArea(
      child: !loading
          ? Stack(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    _handlerRenderTemperature(),
                    _handlerRenderDetails(),
                  ],
                ),
                _handlerRenderFindButtom(),
              ],
            )
          : Loading(),
    );
  }

  Expanded _handlerRenderTemperature() {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            weather.cityName,
            style: TextStyle(
              color: kColorTextLabel,
              fontSize: 20,
            ),
          ),
          Text(
            '${weather.getTempInCelsius}C',
            style: TextStyle(
              color: kColorTextLabel,
              fontSize: 100.0,
              fontWeight: FontWeight.w900,
            ),
          ),
          showInput ? _handlerRenderInput() : Container(),
        ],
      ),
    );
  }

  Expanded _handlerRenderDetails() {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(top: 50),
        decoration: BoxDecoration(
          color: Color(0xFFededed),
        ),
        child: ListView.builder(
          itemCount: weathers.length,
          itemBuilder: (BuildContext context, index) {
            return WeatherDetail(
              weather: weathers[index],
            );
          },
        ),
      ),
    );
  }

  Center _handlerRenderFindButtom() {
    return Center(
      child: RawMaterialButton(
        onPressed: onPressFindButtom,
        shape: CircleBorder(),
        fillColor: Colors.blue,
        padding: EdgeInsets.all(20),
        child: Icon(
          Icons.search,
          color: Colors.white,
        ),
      ),
    );
  }

  Container _handlerRenderInput() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        focusNode: inputFocusNode,
        onFieldSubmitted: getCityWeather,
        onChanged: (value) => city = value,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
