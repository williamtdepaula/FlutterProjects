import 'dart:async';

import 'package:cars_flutter/dataBases/DAO/GenericDAO.dart';

import '../../models/Cars.dart';
import '../dbHelper.dart';
import 'package:sqflite/sqflite.dart';

// Data Access Object
class CarDAO extends GenericDAO<Car> {
  @override
  String get nameTable => 'carro';

  @override
  Car fromJson(Map<String, dynamic> map){
    return Car.fromJson(map);
  }
  
  Future<List<Car>> findAllByTipo(String tipo) async {
    final dbClient = await db;

    final list =
        await dbClient.rawQuery('select * from carro where tipo =? ', [tipo]);

    return list.map<Car>((json) => fromJson(json)).toList();
  }
}
