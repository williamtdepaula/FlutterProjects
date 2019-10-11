import 'package:flutter/material.dart';
import 'package:primero_app_flutter/screens/hello_list_view.dart';

class DogPage extends StatelessWidget {
  Dog dog;

  DogPage(this.dog);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          dog.nome,
          style: TextStyle(color: Colors.white,),
        ),
      ),
      body: _renderBody(),
    );
  }

  _renderBody() {
    return Image.asset(dog.foto);
  }
}
