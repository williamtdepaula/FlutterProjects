import 'package:flutter/material.dart';
import '../components/Lists/itemListDefault.dart';
import '../models/Dog.dart';
import '../utils//Helper.dart';
import './dogDetails.dart';

class PageOne extends StatefulWidget {
  @override
  _PageOneState createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  bool grid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView Page'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.list),
            onPressed: () => setState(() => grid = false),
          ),
          IconButton(
            icon: Icon(Icons.grid_on),
            onPressed: () => setState(() => grid = true),
          ),
        ],
      ),
      body: _handleRenderBody(),
    );
  }

  _handleRenderBody() {
    List<Dog> dogs = [
      Dog('Dog primero', 'assets/imgs/dog1.png'),
      Dog('Segundo', 'assets/imgs/dog2.png'),
      Dog('Segundo', 'assets/imgs/dog3.png'),
      Dog('Segundo', 'assets/imgs/dog4.png'),
      Dog('Segundo', 'assets/imgs/dog5.png'),
    ];

    if (grid) {
      return GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: dogs.length,
        itemBuilder: (context, i) => ItemListDefault(
          dogs[i].name,
          dogs[i].pathPicture,
          onPressed: () {
            Helper.pushNavigatior(context, DogDetails(dogs[i]));
          },
        ),
      );
    } else {
      return ListView.builder(
        itemCount: dogs.length,
        itemExtent:
            300, //DEFINE UM TAMANHO FIXO PARA TODOS AS CELULAS DA LISTA, OU SEJA, A A CÉLULAR NÃO FICA DO TAMANHO RESPECTIVO AO SEU CONTEÚDO
        itemBuilder: (context, index) {
          return ItemListDefault(
            dogs[index].name,
            dogs[index].pathPicture,
            onPressed: () {
              Helper.pushNavigatior(context, DogDetails(dogs[index]));
            },
          );
        },
      );
    }
    /* return ListView(
      //itemExtent: 300, DEFINE UM TAMANHO FIXO PARA TODOS AS CELULAS DA LISTA, OU SEJA, A A CÉLULAR NÃO FICA DO TAMANHO RESPECTIVO AO SEU CONTEÚDO
      children: <Widget>[
        ItemListDefault('assets/imgs/dog1.png'),
        ItemListDefault('assets/imgs/dog2.png'),
        ItemListDefault('assets/imgs/dog3.png'),
        ItemListDefault('assets/imgs/dog4.png'),
        ItemListDefault('assets/imgs/dog5.png'),
      ],
    );*/
  }
}
