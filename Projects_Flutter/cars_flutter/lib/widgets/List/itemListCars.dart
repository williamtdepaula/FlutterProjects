import 'package:cached_network_image/cached_network_image.dart';
import 'package:cars_flutter/models/Cars.dart';
import 'package:cars_flutter/screens/carDetails.dart';
import 'package:cars_flutter/utils/Helper.dart';
import 'package:flutter/material.dart';

class ItemListCars extends StatelessWidget {
  Car car;

  ItemListCars(this.car);

  @override
  Widget build(BuildContext context) {
    return _handleRenderItemList(context);
  }

  _handleRenderItemList(context) {
    return Card(
      margin: EdgeInsets.all(10),
      color: Colors.grey[100],
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, //Alinha os itens no começo
          children: <Widget>[
            Center(child: CachedNetworkImage(imageUrl: car.urlFoto ?? 'https://lh3.googleusercontent.com/proxy/hSRSRlpE4uW0vqs9S4wdoObX4FduWRID5AvdgZ6SPrdtmluKoUeUIe5xnSD4b08A_4N11kbsqNxVo44i8gPAkI0oNBe4aqRnag_zDpOoRxW6mx3pu37WPJrifzhfoEE')),
            Text(
              car.nome ?? 'Carro',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              car.descricao ?? 'Carro detalhes...',
              style: TextStyle(fontSize: 16),
            ),
            ButtonBar(
              children: <Widget>[
                FlatButton(
                  child: const Text('Detalhes'),
                  onPressed: ()  => _clickCar(context),
                ),
                FlatButton(
                  child: const Text('Share'),
                  onPressed: () {/* ... */},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _clickCar(context){
    Helper.pushNavigator(context, CarDetails(this.car));
  }
}
