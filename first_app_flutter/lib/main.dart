import 'screens/homePage.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.blue,
        ),
        home: Home());
  }

  Scaffold homeStructure() {
    return Scaffold(
        appBar: AppBar(
          title: Text('Hello World'),
          backgroundColor: Colors.blue,
        ),
        body: Container(color: Colors.green));
  }
}

