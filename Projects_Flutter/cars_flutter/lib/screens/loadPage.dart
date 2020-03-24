import 'package:cars_flutter/dataBases/dbHelper.dart';
import 'package:cars_flutter/models/User.dart';
import 'package:cars_flutter/screens/homePage.dart';
import 'package:cars_flutter/screens/loginPage.dart';
import 'package:cars_flutter/utils/Helper.dart';
import 'package:flutter/material.dart';

class LoadPage extends StatefulWidget {
  @override
  _LoadPageState createState() => _LoadPageState();
}

class _LoadPageState extends State<LoadPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _initDB();
  }

  void _initDB() async {
    await DatabaseHelper.getInstance().db;

    User user = await User.getUserFromPreferences();

    if(user != null) Helper.pushNavigator(context, HomePage());
    else Helper.pushNavigator(context, LoginPage());

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
