import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_slidy_app/app/screens/home/home_controller.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController _homeController = Modular.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: false,
      ),
      body: _handlerRenderBody(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, '/other');
        },
      ),
    );
  }

  Widget _handlerRenderBody() {
    return Center(
      child: TextField(
        onChanged: _homeController.setText,
        decoration: InputDecoration(labelText: 'Um Texto Qualquer'),
      ),
    );
  }
}
