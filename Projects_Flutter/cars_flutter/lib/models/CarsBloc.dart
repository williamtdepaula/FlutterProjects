import 'dart:async';

import 'package:cars_flutter/dataBases/Car/CarDAO.dart';
import 'package:cars_flutter/models/Cars.dart';
import 'package:cars_flutter/models/Network.dart';
import 'package:cars_flutter/models/SimpleBloc.dart';
import 'package:cars_flutter/utils/Api.dart';

class CarsBloc extends SimpleBloc {
  Future<bool> getCars(String typeCar) async {
    try {
      List<Car> cars;

      var connection = await Network.isConnected();

      if (connection) {
        cars = await Api.getCars(typeCar);

        CarDAO carDAO = new CarDAO();

        //Salva os carros no DB
        cars.forEach((car) => carDAO.save(car));

      } else {

        cars = await CarDAO().findAllByTipo(typeCar);

      }

      add(cars); //Executa a StreamBuilder

      return true;
    } catch (e) {
      addError(e);
    }
  }
}
