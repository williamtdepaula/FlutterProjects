import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_slidy_app/app/screens/home/home_controller.dart';

class OtherScreen extends StatefulWidget {
  @override
  _OtherScreenState createState() => _OtherScreenState();
}

class _OtherScreenState extends State<OtherScreen> {
  HomeController _homeController = Modular.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Other'),
        centerTitle: false,
      ),
      body: _handlerRenderBody(),
    );
  }

  Widget _handlerRenderBody() {
    return Center(
      child: Text('Texto digitado - ${_homeController.text}'),
    );
  }
}
