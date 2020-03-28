import 'package:cars_flutter/Service/FavoriteService.dart';
import 'package:cars_flutter/models/Cars.dart';
import 'package:flutter/material.dart';

class FavoriteModel extends ChangeNotifier{
  List<Car> cars = [];

  getCarsFavoriteFromDB() async{
    this.cars = await FavoriteService().getCarsFavoriteFromDB();

    notifyListeners();
  }
}