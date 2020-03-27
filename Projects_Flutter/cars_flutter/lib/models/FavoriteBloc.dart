import 'dart:async';

import 'package:cars_flutter/Service/FavoriteService.dart';
import 'package:cars_flutter/models/Cars.dart';
import 'package:cars_flutter/models/SimpleBloc.dart';

class FavoriteBloc extends SimpleBloc {
  Future<bool> getCarsFavoritesFromDB() async {
    try {
      List<Car> cars;

      cars = await FavoriteService().getCarsFavoriteFromDB();

      add(cars); //Executa a StreamBuilder

      return true;
      
    } catch (e) {
      addError(e);
    }
  }
}
