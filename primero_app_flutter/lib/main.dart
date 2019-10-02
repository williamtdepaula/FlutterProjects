import 'package:flutter/material.dart';
import 'package:primero_app_flutter/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Colors.blue),
        home: HomePage());
  }

  //Função que retorna um Widget
  home() {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello World"),
      ),
      body: Container(color: Colors.white),
    );
  }
}
