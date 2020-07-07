import 'package:flutter/material.dart';
import 'package:mi_card/utils/Helper.dart';

class Details extends StatelessWidget {
  String urlImage;
  String name;
  String about;

  Details(this.urlImage, this.name, this.about);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _handlerRenderBody(context));
  }

  Widget _handlerRenderBody(BuildContext context) {
    final sizePhone = MediaQuery.of(context).size;

    backPage(BuildContext context) {
      Helper.pop(context);
    }

    return SafeArea(
      child: Stack(
        children: <Widget>[
          Container(
            color: Colors.black,
            child: Hero(
              tag: 'image',
              child: Image.network(
                this.urlImage,
                width: sizePhone.width,
                height: sizePhone.height,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: InkWell(
              onTap: () => backPage(context),
              child: Icon(
                Icons.arrow_back_ios,
                size: 30,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomLeft,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 250),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Hero(
                  tag: 'name',
                  child: Material(
                    type: MaterialType.transparency,
                    child: Text(
                      this.name,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Hero(
                  tag: 'about',
                  child: Text(
                    this.about,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
