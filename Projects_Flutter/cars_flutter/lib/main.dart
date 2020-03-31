import 'package:cars_flutter/models/EventBus.dart';
import 'package:cars_flutter/models/FavoriteBloc.dart';
import 'package:cars_flutter/models/FavoriteModel.dart';
import 'package:cars_flutter/screens/loadPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => new EventBus(),
          dispose: (context, bus) => bus.dispose(),
        ),
        //COM MODEL //USA ChangeNotifierProvider para ficar ouvindo
        ChangeNotifierProvider<FavoriteModel>(//Quando fica ouvindo algo
          create: (context) => new FavoriteModel(),
        ),
        //COM BLOC
        Provider<FavoriteBloc>(
          create: (context) => new FavoriteBloc(),
          dispose: (
            context,
            bloc,
          ) =>
              bloc.clearStream(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.white, //Cor padrão da aplicação
        ),
        home: LoadPage(),
      ),
    );
  }
}
