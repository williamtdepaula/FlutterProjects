import 'package:cars_flutter/models/Cars.dart';
import 'package:flutter/material.dart';

class CarDetails extends StatelessWidget {
  Car car;

  CarDetails(this.car);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(car.nome),
        centerTitle: true,
      ),
      body: _handleRenderBody(),
    );
  }

  _handleRenderBody() {
    return Center(child: Image.network(car.urlFoto));
  }
}
