import 'package:flutter/material.dart';
import 'package:primero_app_flutter/screens/dog_detail.dart';
import 'package:primero_app_flutter/utils/Helper.dart';

class Dog {
  String nome;
  String foto;

  Dog(this.nome, this.foto);
}

class HelloListView extends StatefulWidget {
  @override
  _HelloListViewState createState() => _HelloListViewState();
}

class _HelloListViewState extends State<HelloListView> {
  bool _gridView = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.list),
            onPressed: () => setState(() {
              _gridView = false;
            }),
          ),
          IconButton(
            icon: Icon(Icons.grid_on),
            onPressed: () => setState(() {
              _gridView = true;
            }),
          ),
        ],
      ),
      body: _renderBody(),
    );
  }

  _renderBody() {
    List<Dog> dogs = [
      Dog('Jhon', 'assets/imgs/dog1.png'),
      Dog('Afonsom Cleber', 'assets/imgs/dog2.png'),
      Dog('Dog 3', 'assets/imgs/dog3.png'),
      Dog('Dog 4', 'assets/imgs/dog4.png'),
      Dog('Dog 5', 'assets/imgs/dog5.png'),
      Dog('Jhon', 'assets/imgs/dog1.png'),
      Dog('Afonsom Cleber', 'assets/imgs/dog2.png'),
      Dog('Dog 3', 'assets/imgs/dog3.png'),
      Dog('Dog 4', 'assets/imgs/dog4.png'),
      Dog('Dog 5', 'assets/imgs/dog5.png'),
      Dog('Jhon', 'assets/imgs/dog1.png'),
      Dog('Afonsom Cleber', 'assets/imgs/dog2.png'),
      Dog('Dog 3', 'assets/imgs/dog3.png'),
      Dog('Dog 4', 'assets/imgs/dog4.png'),
      Dog('Dog 5', 'assets/imgs/dog5.png'),
      Dog('Jhon', 'assets/imgs/dog1.png'),
      Dog('Afonsom Cleber', 'assets/imgs/dog2.png'),
      Dog('Dog 3', 'assets/imgs/dog3.png'),
      Dog('Dog 4', 'assets/imgs/dog4.png'),
      Dog('Dog 5', 'assets/imgs/dog5.png'),
      Dog('Jhon', 'assets/imgs/dog1.png'),
      Dog('Afonsom Cleber', 'assets/imgs/dog2.png'),
      Dog('Dog 3', 'assets/imgs/dog3.png'),
      Dog('Dog 4', 'assets/imgs/dog4.png'),
      Dog('Dog 5', 'assets/imgs/dog5.png'),
      Dog('Jhon', 'assets/imgs/dog1.png'),
      Dog('Afonsom Cleber', 'assets/imgs/dog2.png'),
      Dog('Dog 3', 'assets/imgs/dog3.png'),
      Dog('Dog 4', 'assets/imgs/dog4.png'),
      Dog('Dog 5', 'assets/imgs/dog5.png'),
    ];

    //lista dinamica

    if (_gridView) {
      return GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: dogs.length,
        itemBuilder: (context, index) {
          return _renderItemList(dogs, context, index);
        },
      );
    } else {
      return ListView.builder(
        itemExtent: 350,
        itemCount: dogs.length,
        itemBuilder: (context, index) {
          return _renderItemList(dogs, context, index);
        },
      );
    }

    //Lista não dinamica
    /*ListView(
      //itemExtent: 600,//DEFINE UM TAMANHO FIXO DE CADA CELULA DA LISTA
      children: imgs,
    );*/

    /*Column( EXEMPLO DE EXPANDED
      children: <Widget>[
        Expanded(
          flex: 1,
          child: PageView(
            children: <Widget>[
              _renderImage('assets/imgs/dog1.png'),
              _renderImage('assets/imgs/dog2.png'),
              _renderImage('assets/imgs/dog3.png'),
              _renderImage('assets/imgs/dog4.png'),
              _renderImage('assets/imgs/dog5.png'),
            ],
          ),
        ),
        Expanded(
          flex: 3,
          child: PageView(
            children: <Widget>[
              _renderImage('assets/imgs/dog1.png'),
              _renderImage('assets/imgs/dog2.png'),
              _renderImage('assets/imgs/dog3.png'),
              _renderImage('assets/imgs/dog4.png'),
              _renderImage('assets/imgs/dog5.png'),
            ],
          ),
        ),
      ],
    );*/
  }

  _renderItemList(List<Dog> dogs, context, index) {
    Dog dog = dogs[index];

    return GestureDetector(
      onTap: () => push(context, DogPage(dog)),
      child: Stack(
        fit: StackFit
            .expand, // extende a imagem, só funciona se a ListView possuir itemExtent
        children: <Widget>[
          //SizedBox.expand(//Mesmo funcionamento do fit: StackFit.expand
          _renderImage(dog.foto),
          Container(
              padding: EdgeInsets.only(left: 10, bottom: 10),
              alignment: Alignment.bottomLeft,
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Text(
                  dog.nome,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              )),
          //)
        ],
      ),
    );
  }

  Image _renderImage(String imagePath) {
    return Image.asset(
      imagePath,
      fit: BoxFit.cover,
    );
  }
}
