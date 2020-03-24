import 'package:cached_network_image/cached_network_image.dart';
import 'package:cars_flutter/models/Cars.dart';
import 'package:cars_flutter/models/LoremBloc.dart';
import 'package:flutter/material.dart';

class CarDetails extends StatefulWidget {
  Car car;

  CarDetails(this.car);

  @override
  _CarDetailsState createState() => _CarDetailsState();
}

class _CarDetailsState extends State<CarDetails> {
  LoremBloc _loremBloc = LoremBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _loremBloc.getLorem();
  }

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
                Text(widget.car.nome,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )),
                Text(widget.car.tipo,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.favorite,
                    size: 40,
                    color: Colors.red,
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

  onSelectedItemPopupMenu(String valueSelected) {
    if (valueSelected == 'Editar') print('Editar');
    if (valueSelected == 'Deletar') print('Deletar');
    if (valueSelected == 'Share') print('Share');
  }

  clickOnFavorite() {}

  clickOnShare() {}

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _loremBloc.clearStreams();
  }
}
