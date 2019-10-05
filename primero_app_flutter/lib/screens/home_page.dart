import 'package:flutter/material.dart';
import 'package:primero_app_flutter/screens/hello_list_view.dart';
import 'package:primero_app_flutter/screens/hello_page1.dart';
import 'package:primero_app_flutter/screens/hello_page2.dart';
import 'package:primero_app_flutter/screens/hello_page3.dart';
import 'package:primero_app_flutter/utils/Helper.dart';
import 'package:primero_app_flutter/widgets/Buttons/button_blue.dart';

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

    return Container(
      //SingleChildScrollView quando for um scroll
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
      ),
    );
  }

  _renderContainerButtons(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            BlueButton('ListView',
                onPressed: () => onClickButton(context, HelloListView())),
            BlueButton('Page 2',
                onPressed: () => onClickButton(context, Hello_page2())),
            BlueButton('Page 3',
                onPressed: () => onClickButton(context, Hello_page3())),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            BlueButton('Snack',
                onPressed: () => onClickButton(context, Hello_page1())),
            BlueButton('Dialog',
                onPressed: () => onClickButton(context, Hello_page1())),
            BlueButton('Toast',
                onPressed: () => onClickButton(context, Hello_page1())),
          ],
        )
      ],
    );
  }

  _onClickSnack() {}
  _onClickDialog() {}
  _onClickToast() {}

  /*_renderButton(String textButton, Function onPressed) {
    return BlueButton(textButton, () => onPressed());
  }*/

  void onClickButton(BuildContext context, Widget page) async {
    String s = await push(context, page);
    print(s);
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
