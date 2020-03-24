import 'dart:async';

import 'package:cars_flutter/models/CarsBloc.dart';
import 'package:cars_flutter/widgets/List/itemListCars.dart';
import 'package:flutter/material.dart';
import '../../models/Cars.dart';

class ListCars extends StatelessWidget {

  List<Car> cars;

  ListCars(this.cars);

  @override
  Widget build(BuildContext context) {

    return _handleRenderListView(cars);
  }

  _handleRenderListView(List<Car> cars) {
    return ListView.builder(
      itemCount: cars.length,
      itemBuilder: (BuildContext context, i) {
        Car car = cars[i];

        return ItemListCars(car);
      },
    );
  }

}
