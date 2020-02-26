import 'package:cars_flutter/models/Cars.dart';
import 'package:cars_flutter/utils/Api.dart';
import 'package:cars_flutter/widgets/Drawer/DrawerDefault.dart';
import 'package:cars_flutter/widgets/List/itemListCars.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carros Flutter'),
        centerTitle: true,
      ),
      body: _handleRenderBody(),
      drawer: DrawerDefault(),
    );
  }

  _handleRenderBody() {
    List<Car> cars = Api.getCars();

    return ListView.builder(
      itemCount: cars.length,
      itemBuilder: (BuildContext context, i) {
        Car car = cars[i];

        return ItemListCars(car);
      },
    );
  }
}
