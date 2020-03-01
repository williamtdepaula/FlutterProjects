import 'dart:async';

import 'package:cars_flutter/models/Cars.dart';
import 'package:cars_flutter/models/SimpleBloc.dart';
import 'package:cars_flutter/utils/Api.dart';

class CarsBloc extends SimpleBloc{
  getCars(String typeCar) async {
    try {
      List<Car> cars = await Api.getCars(typeCar);

      add(cars); //Executa a StreamBuilder
    } catch (e) {
      addError(e);
    }
  }

}
