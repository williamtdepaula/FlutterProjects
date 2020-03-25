import 'package:cars_flutter/dataBases/Favorite/FavoriteDAO.dart';
import 'package:cars_flutter/models/Cars.dart';
import 'package:cars_flutter/models/Favorite.dart';

class FavoriteService extends FavoriteDAO {
  favoriteCar(Car car) async {
    Favorite fav = new Favorite.fromCar(car);

    bool exist = await exists(car.id);

    if (exist)
      delete(car.id);
    else
      await save(fav);
  }

  getCarsFromDB() async {
    List<Favorite> carsFavorites = await findAll();

    List<Car> carsFromDB;

    carsFromDB = carsFavorites.map((favorite) => );
  
  }
}
