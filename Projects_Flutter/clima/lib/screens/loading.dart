import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    super.initState();
  }

  void getLocation() async {
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);

    print(position);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _rendlerRenderBody(),
    );
  }

  Center _rendlerRenderBody() {
    return Center(
      child: RaisedButton(
        onPressed: getLocation,
        child: Text('GET LOCATION'),
      ),
    );
  }
}
