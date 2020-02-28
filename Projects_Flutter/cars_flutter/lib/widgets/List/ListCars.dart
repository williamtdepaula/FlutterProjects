import 'package:cars_flutter/widgets/List/itemListCars.dart';
import 'package:flutter/material.dart';
import '../../models/Cars.dart';
import '../../utils/Api.dart';

class ListCars extends StatefulWidget{
  String typeCar;

  ListCars(this.typeCar);

  @override
  _ListCarsState createState() => _ListCarsState();
}

class _ListCarsState extends State<ListCars> with AutomaticKeepAliveClientMixin<ListCars> {

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context){
    super.build(context);

    return _handleRenderListCars();
  }

  /*
    Quando usa o async ou await, em uma função que retorna um Widget, o retorno se torna 
    Future, e não é possível renderizar um Widget do tipo Future.
    Então é necessário usar o FutureBuilder no retorno.
  */
  FutureBuilder _handleRenderListCars(){
    Future<List<Car>> carsFuture = Api.getCars(widget.typeCar);

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
        },);
        
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