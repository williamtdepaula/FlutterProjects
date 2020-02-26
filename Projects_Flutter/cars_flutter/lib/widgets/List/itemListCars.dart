import 'package:cars_flutter/models/Cars.dart';
import 'package:flutter/material.dart';

class ItemListCars extends StatelessWidget {
  Car car;

  ItemListCars(this.car);

  @override
  Widget build(BuildContext context) {
    return _handleRenderItemList();
  }

  _handleRenderItemList() {
    return Card(
      margin: EdgeInsets.all(10),
      color: Colors.grey[100],
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, //Alinha os itens no começo
          children: <Widget>[
            Center(child: Image.network(car.urlFoto)),
            Text(
              car.nome,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              car.descricao,
              style: TextStyle(fontSize: 16),
            ),
            ButtonBar(
              children: <Widget>[
                FlatButton(
                  child: const Text('Detalhes'),
                  onPressed: () {/* ... */},
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
}
