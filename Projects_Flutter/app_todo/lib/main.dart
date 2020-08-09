import 'package:app_todo/src/models/task_data.dart';
import 'package:app_todo/src/screens/home.page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TaskData(),
      child: MaterialApp(
        initialRoute: HomePage.id,
        routes: {HomePage.id: (_) => HomePage()},
      ),
    );
  }
}
