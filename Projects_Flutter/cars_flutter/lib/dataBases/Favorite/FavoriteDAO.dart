import 'package:cars_flutter/dataBases/DAO/GenericDAO.dart';
import 'package:cars_flutter/models/Favorite.dart';

class FavoriteDAO extends GenericDAO<Favorite>{
   @override
  String get nameTable => 'favorito';

  @override
  Favorite fromJson(Map<String, dynamic> map){
    return Favorite.fromJson(map);
  }

  
}