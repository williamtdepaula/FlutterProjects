import 'package:cars_flutter/models/Cars.dart';
import 'package:cars_flutter/utils/Api.dart';
import 'package:cars_flutter/widgets/Drawer/DrawerDefault.dart';
import 'package:cars_flutter/widgets/List/itemListCars.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  String typeCar;

  HomePage(this.typeCar);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Carros Flutter'),
          centerTitle: true,
          bottom: TabBar(tabs: [
            Tab(text: 'Carros'),
            Tab(text: 'Esportivos'),
            Tab(text: 'Luxo'),
          ]),
        ),
        body: TabBarView(
          children: [
            _handleRenderBody(TypeCar.classics),
            _handleRenderBody(TypeCar.classics),
            _handleRenderBody(TypeCar.classics),
          ],
        ),
        drawer: DrawerDefault(),
      ),
    );
  }

  /*
    Quando usa o async ou await, em uma função que retorna um Widget, o retorno se torna 
    Future, e não é possível renderizar um Widget do tipo Future.
    Então é necessário usar o FutureBuilder no retorno.
  */
  _handleRenderBody(typeCar) {
    Future<List<Car>> carsFuture = Api.getCars('Classicos');

    //Espera a variável "carsFuture" ser resolvida e chama builder
    return FutureBuilder(
        future: carsFuture,
        builder: (BuildContext context, snapshot) {
          //Ocorreu algum erro na requisição
          if (snapshot.hasError) {
            print(snapshot.error);
            return Container(
              padding: EdgeInsets.all(10),
              child: Center(
                child: Text(
                  'Houve um problema na requisição, tente novamente mais tarde',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }

          //Se ainda não tiver completado a requisição
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.blue),
              ),
            );
          }

          List<Car> cars = snapshot
              .data; //Dados da resposta (Inicia com null, então deve retornar algo no lugar)
          return _handleRenderListView(cars);
        });
  }

  _handleRenderListView(List<Car> cars) {
    return ListView.builder(
      itemCount: cars.length,
      itemBuilder: (BuildContext context, i) {
        Car car = cars[i];

        return ItemListCars(car);
      },
    );
  }
}
