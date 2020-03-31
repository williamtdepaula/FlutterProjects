import 'package:cars_flutter/models/Cars.dart';
import 'package:cars_flutter/models/Entity.dart';

class Favorite extends Entity {
  int id;
  String nome;

  Favorite.fromCar(Car car){
    this.id = car.id;
    this.nome = car.nome;
  }

  Favorite.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
  }

  @override
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    return data;
  }
}
