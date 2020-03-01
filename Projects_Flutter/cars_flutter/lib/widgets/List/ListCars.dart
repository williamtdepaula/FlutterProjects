import 'dart:async';

import 'package:cars_flutter/models/CarsBloc.dart';
import 'package:cars_flutter/widgets/List/itemListCars.dart';
import 'package:flutter/material.dart';
import '../../models/Cars.dart';

class ListCars extends StatefulWidget {
  String typeCar;

  ListCars(this.typeCar);

  @override
  _ListCarsState createState() => _ListCarsState();
}

class _ListCarsState extends State<ListCars>
    with AutomaticKeepAliveClientMixin<ListCars> {

  CarsBloc _carsBloc = CarsBloc();//Coloca CarsBloc(), para não iniciar com null

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _carsBloc.getCars(widget.typeCar);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return _handleRenderListCars();
  }

  /*
    Quando usa o async ou await, em uma função que retorna um Widget, o retorno se torna 
    Future, e não é possível renderizar um Widget do tipo Future.
    Então é necessário usar o FutureBuilder no retorno.
  */
  _handleRenderListCars() {
    return StreamBuilder(
      stream: _carsBloc.stream,
      builder: (BuildContext context, snapshot) {
        //Ocorreu algum erro na requisição
        if (snapshot.hasError) {
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
      },
    );
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

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _carsBloc.clearStream();
  }
}
