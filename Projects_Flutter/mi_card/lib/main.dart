import 'package:flutter/material.dart';
import 'package:mi_card/details.dart';
import 'package:mi_card/utils/Helper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  Color colorDefaultApp = Colors.black;

  openDetailsPage(BuildContext context) {
    Helper.navigate(
        context,
        Details(
          'https://media-exp1.licdn.com/dms/image/C4E03AQH7i3XV45KPOg/profile-displayphoto-shrink_200_200/0?e=1596067200&v=beta&t=6rrkuDOGtf_31l2ZZRT05qyGr6W9RLoYxTcUs6Wmerg',
          'William Tristão de Paula',
          'FLUTTER & REACT NATIVE DEVELOPER'
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorDefaultApp,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () => openDetailsPage(context),
              child: Hero(
                tag: 'image',
                child: CircleAvatar(
                  backgroundColor: Colors.grey[100],
                  radius: 70,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(70),
                    child: Image.network(
                      'https://media-exp1.licdn.com/dms/image/C4E03AQH7i3XV45KPOg/profile-displayphoto-shrink_200_200/0?e=1596067200&v=beta&t=6rrkuDOGtf_31l2ZZRT05qyGr6W9RLoYxTcUs6Wmerg',
                    ),
                  ),
                ),
              ),
            ),
            Hero(
              tag: 'name',
              child: Material(
                type: MaterialType.transparency,
                child: Text(
                  'William Tristão de Paula',
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Pacifico',
                  ),
                ),
              ),
            ),
            Hero(
              tag: 'about',
              child: Text(
                'FLUTTER & REACT NATIVE DEVELOPER',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.teal[200],
                  fontFamily: 'Sans Source Pro',
                  letterSpacing: 2.5,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
            SizedBox(
              height: 20,
              width: 120.0,
              child: Divider(color: Colors.teal[100]),
            ),
            _handlerRenderContactsCards(
                Icons.email, 'williamtristao@hotmail.com'),
            _handlerRenderContactsCards(Icons.phone, '+55 97453-1345'),
          ],
        ),
      ),
    );
  }

  _handlerRenderContactsCards(IconData iconName, String text) {
    return Card(
        margin: EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Padding(
          padding: EdgeInsets.all(3),
          child: ListTile(
            leading: Icon(
              iconName,
              color: colorDefaultApp,
              size: 35,
            ),
            title: Text(
              text,
              style: TextStyle(
                color: colorDefaultApp,
                fontSize: 18,
                fontFamily: 'Sans Source Pro',
              ),
            ),
          ),
        ));
  }
}
