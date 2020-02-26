import 'package:flutter/material.dart';
import '../models/Dog.dart';

class DogDetails extends StatelessWidget {
  Dog dog;

  DogDetails(this.dog);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(dog.name),
      ),
      body: _handleRenderBody(),
    );
  }

  _handleRenderBody() {
    return Image.asset(dog.pathPicture);
  }
}
