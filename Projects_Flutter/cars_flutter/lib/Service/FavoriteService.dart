import 'package:cars_flutter/dataBases/Car/CarDAO.dart';
import 'package:cars_flutter/dataBases/Favorite/FavoriteDAO.dart';
import 'package:cars_flutter/models/Cars.dart';
import 'package:cars_flutter/models/Favorite.dart';
import 'package:cars_flutter/models/FavoriteModel.dart';
import 'package:provider/provider.dart';
import '../models/FavoriteBloc.dart';

class FavoriteService extends FavoriteDAO {
  Future<bool> favoriteCar(context, Car car) async {
    Favorite fav = new Favorite.fromCar(car);

    bool exist = await exists(car.id);

    if (exist) {
      delete(car.id);

      //MODEEEEEl
      Provider.of<FavoriteModel>(context, listen: false).getCarsFavoriteFromDB();

      //BLOOOOC Provider.of<FavoriteBloc>(context, listen: false).getCarsFavoritesFromDB();

      return false;
    } else {
      await save(fav);

      //MODEEEEEl
      Provider.of<FavoriteModel>(context, listen: false).getCarsFavoriteFromDB();

      //BLOOOOC Provider.of<FavoriteBloc>(context, listen: false).getCarsFavoritesFromDB();

      return true;
    }
  }

  Future<List<Car>> getCarsFavoriteFromDB() async {
    List<Car> carsFromDB = await CarDAO()
        .query('select * from carro c, favorito f where c.id = f.id');

    return carsFromDB;
  }
}
