import 'dart:async';

import 'package:cars_flutter/models/CarsBloc.dart';
import 'package:flutter/material.dart';
import '../../models/Cars.dart';
import '../List/ListCars.dart';

class CarTab extends StatefulWidget {
  String typeCar;

  CarTab(this.typeCar);

  @override
  _CarTabState createState() => _CarTabState();
}

class _CarTabState extends State<CarTab>
    with AutomaticKeepAliveClientMixin<CarTab> {
  CarsBloc _carsBloc =
      CarsBloc(); //Coloca CarsBloc(), para não iniciar com null

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

        return RefreshIndicator(
          onRefresh: _onRefresh,
          child: ListCars(cars),
        );
      },
    );
  }

  Future<void> _onRefresh(){
    return _carsBloc.getCars(widget.typeCar);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _carsBloc.clearStream();
  }
}
