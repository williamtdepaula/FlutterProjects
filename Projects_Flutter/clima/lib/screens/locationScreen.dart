import 'package:clima/models/Location.dart';
import 'package:clima/models/LocationScreenBloc.dart';
import 'package:clima/models/Weather.dart';
import 'package:clima/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
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

  @override
  void initState() {
    super.initState();

    onLoad();
  }

  void onLoad() async {
    weather = await _locationScreenBloc.getWeatherByLatAndLong();

    setState(() {
      loading = false;
    });
  }

  void onPressFindButtom() {
    if (!showInput) {
      setState(() {
        showInput = true;
      });

      inputFocusNode.requestFocus();

      KeyboardVisibilityNotification().addNewListener(onChange: (focus) {
        setVisibilityInput(show: focus);
      });

      inputFocusNode.addListener(() {
        setVisibilityInput(show: inputFocusNode.hasFocus);
      });
    } else getCityWeather(city);
  }

  void getCityWeather(String city) async {
    setState(() {
      loading = true;
    });

    weather = await LocationScreenBloc().getWeatherByCityName(city);

    setState(() {
      loading = false;
    });
  }

  void setVisibilityInput({show = false}) {
    setState(() {
      showInput = show;
    });
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
                showInput ? _handlerRenderInput() : Container(),
              ],
            )
          : SpinKitDoubleBounce(
              color: Colors.blue,
              size: 100.0,
            ),
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
        ],
      ),
    );
  }

  Expanded _handlerRenderDetails() {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Color(0xFFededed),
        ),
        child: Text("Está uma boa temperatura!"),
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

  Positioned _handlerRenderInput() {
    return Positioned(
      top: MediaQuery.of(context).size.height / 3,
      child: SingleChildScrollView(
        child: Container(
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
        ),
      ),
    );
  }
}
