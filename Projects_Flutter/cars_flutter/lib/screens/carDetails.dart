import 'package:cached_network_image/cached_network_image.dart';
import 'package:cars_flutter/Service/FavoriteService.dart';
import 'package:cars_flutter/models/Cars.dart';
import 'package:cars_flutter/models/LoremBloc.dart';
import 'package:cars_flutter/screens/addCar.dart';
import 'package:cars_flutter/utils/Helper.dart';
import 'package:flutter/material.dart';

class CarDetails extends StatefulWidget {
  Car car;

  CarDetails(this.car);

  @override
  _CarDetailsState createState() => _CarDetailsState();
}

class _CarDetailsState extends State<CarDetails> {
  Color colorFavorite = Colors.grey;

  LoremBloc _loremBloc = LoremBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    verifyIfIsFavorite();

    _loremBloc.getLorem();
    
  }

  verifyIfIsFavorite() async {
    FavoriteService favoriteService = new FavoriteService();

    bool isFavorite = await favoriteService.exists(widget.car.id);

    setCarIsFavorite(isFavorite);
  }

  onSelectedItemPopupMenu(String valueSelected) {
    if (valueSelected == 'Editar') Helper.pushNavigator(context, AddCar(carro: widget.car));
    if (valueSelected == 'Deletar') print('Deletar');
    if (valueSelected == 'Share') print('Share');
  }

  clickOnFavorite() async {
    FavoriteService favoriteService = new FavoriteService();

    bool save = await favoriteService.favoriteCar(context, widget.car);

    setCarIsFavorite(save);
  }

  setCarIsFavorite(isFavorite) {
    setState(() {
      colorFavorite = isFavorite ? Colors.red : Colors.grey;
    });
  }

  clickOnShare() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(widget.car.nome),
          centerTitle: true,
          actions: <Widget>[
            IconButton(icon: Icon(Icons.place), onPressed: () {}),
            IconButton(icon: Icon(Icons.videocam), onPressed: () {}),
            PopupMenuButton<String>(
              onSelected: (String value) => onSelectedItemPopupMenu(value),
              itemBuilder: (context) {
                return [
                  PopupMenuItem(value: 'Editar', child: Text('Editar')),
                  PopupMenuItem(value: 'Deletar', child: Text('Deletar')),
                  PopupMenuItem(value: 'Share', child: Text('Share')),
                ];
              },
            )
          ]),
      body: _handleRenderBody(),
    );
  }

  _handleRenderBody() {
    //ListView pra caso ultrapasse o tamanho da tela
    return ListView(
      padding: EdgeInsets.all(16),
      children: <Widget>[
        _handleRenderAboutCar(),
        Divider(),
        _handleRenderTextCar()
      ],
    );
    //return Center(child: Image.network(car.urlFoto));
  }

  _handleRenderAboutCar() {
    return Column(
      children: <Widget>[
        Center(child: CachedNetworkImage(imageUrl: widget.car.urlFoto)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  widget.car.nome,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  widget.car.tipo,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.favorite,
                    size: 40,
                    color: colorFavorite,
                  ),
                  onPressed: clickOnFavorite,
                ),
                IconButton(
                  icon: Icon(Icons.share, size: 40),
                  onPressed: clickOnShare,
                )
              ],
            ),
          ],
        ),
      ],
    );
  }

  _handleRenderTextCar() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 20),
        Text(
          widget.car.descricao,
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
        ),
        SizedBox(height: 20),
        StreamBuilder(
          stream: _loremBloc.stream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(
                snapshot.data,
                style: TextStyle(color: Colors.black, fontSize: 14),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ],
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _loremBloc.clearStreams();
  }
}
