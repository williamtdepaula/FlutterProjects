import 'package:flutter/material.dart';
import 'package:primero_app_flutter/screens/hello_page1.dart';
import 'package:primero_app_flutter/screens/hello_page2.dart';
import 'package:primero_app_flutter/screens/hello_page3.dart';

class HomePage extends StatelessWidget {
  //Widget customizado, por classe sem estado
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello World"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: _renderBody(context),
    );
  }

  _renderBody(context) {
    //contexto do componente
    Size size =
        MediaQuery.of(context).size; //Pegar o tamanho da tela (largura, altura)

    return Container( //SingleChildScrollView quando for um scroll
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _renderText(),
          _renderCarrouselImages(),
          _renderContainerButtons(context),
        ],
      ),
    );

    //EXEMPLO
    /* return Container(
      width: size.width,
      height: size.height,
      color: Colors.red,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, //posição dos itens dentro do container da lista
        mainAxisSize: MainAxisSize.max, //Tamanho do container da lista
        crossAxisAlignment: CrossAxisAlignment.center, //alinha verticalmente
        children: <Widget>[
          _renderButton(),
          _renderButton(),
          _renderButton(),
        ],
      ),
    );*/
  }

  _renderCarrouselImages() {
    return Container(
        margin: EdgeInsets.only(top: 10, bottom: 10),
        height: 300,
        child: PageView(
          children: <Widget>[
            _renderImage('assets/imgs/dog1.png'),
            _renderImage('assets/imgs/dog2.png'),
            _renderImage('assets/imgs/dog3.png'),
            _renderImage('assets/imgs/dog4.png'),
            _renderImage('assets/imgs/dog5.png'),
          ],
        ));
  }

  _renderContainerButtons(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _renderButton('ListView', () => onClickButton(context, Hello_page1())),
            _renderButton('Page 2', () => onClickButton(context, Hello_page2())),
            _renderButton('Page 3', () => onClickButton(context, Hello_page3())),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _renderButton('Snack', () => onClickButton(context, Hello_page1())),
            _renderButton('Dialog', () => onClickButton(context, Hello_page1())),
            _renderButton('Toast', () => onClickButton(context, Hello_page1())),
          ],
        )
      ],
    );
  }

  _renderButton(String textButton, Function onPressed) {
    return RaisedButton(
      child: Text(
        textButton,
        style: TextStyle(color: Colors.white),
      ),
      onPressed: onPressed,
      color: Colors.blue,
    );
  }

  void onClickButton(BuildContext context, Widget page)  {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => page));
}
  _renderImage(String imagePath) {
    return Image.asset(
      imagePath,
      width: 300,
      height: 300,
      fit: BoxFit.contain,
    );
  }

  _renderText() {
    return Text(
      'Hello Flutter',
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Colors.orange,
        fontStyle: FontStyle.italic,
        decoration: TextDecoration.underline,
        decorationColor: Colors.blue,
        decorationStyle: TextDecorationStyle.dotted,
      ),
    );
  }
}
