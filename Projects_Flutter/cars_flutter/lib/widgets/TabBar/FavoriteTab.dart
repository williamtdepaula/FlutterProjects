import 'dart:async';

import 'package:cars_flutter/main.dart';
import 'package:cars_flutter/models/FavoriteBloc.dart';
import 'package:cars_flutter/widgets/Warning/Warning.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/Cars.dart';
import '../List/ListCars.dart';

class FavoriteTab extends StatefulWidget {
  @override
  _FavoriteTabState createState() => _FavoriteTabState();
}

class _FavoriteTabState extends State<FavoriteTab>
    with AutomaticKeepAliveClientMixin<FavoriteTab> {
   //Coloca CarsBloc(), para não iniciar com null

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    FavoriteBloc favoriteBloc = Provider.of<FavoriteBloc>(context, listen: false);
    favoriteBloc.getCarsFavoritesFromDB();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return RefreshIndicator(
      onRefresh: _onRefresh,
      child: _handleRenderListCars(),
    );
  }

  /*
    Quando usa o async ou await, em uma função que retorna um Widget, o retorno se torna 
    Future, e não é possível renderizar um Widget do tipo Future.
    Então é necessário usar o FutureBuilder no retorno.
  */
  _handleRenderListCars() {
    FavoriteBloc favoriteBloc = Provider.of<FavoriteBloc>(context);
    return StreamBuilder(
      stream: favoriteBloc.stream,
      builder: (BuildContext context, snapshot) {
        //Ocorreu algum erro na requisição
        if (snapshot.hasError) {
          return Container(
            padding: EdgeInsets.all(10),
            child: Warning('Houve um problema na requisição, tente novamente mais tarde',),
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

        if (cars.length > 0) return ListCars(cars);
        return Warning('Não há nenhum carro nos seus favoritos, adicione clicado no coração');
        
      },
    );
  }

  Future<void> _onRefresh() {
    return Provider.of<FavoriteBloc>(context).getCarsFavoritesFromDB();
  }

}
