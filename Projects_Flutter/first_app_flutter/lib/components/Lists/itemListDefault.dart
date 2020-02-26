import 'package:flutter/material.dart';

class ItemListDefault extends StatelessWidget {
  String pathFile;
  String nameDog;
  Function onPressed;

  ItemListDefault(this.nameDog, this.pathFile, {this.onPressed});

  @override
  Widget build(BuildContext context) {
    return _handleRenderItemList(pathFile, onPress: () => onPressed());
  }

  GestureDetector _handleRenderItemList(pathFile, {onPress}) {
    return GestureDetector(
      onTap: () => onPress(),
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            pathFile,
            fit: BoxFit.cover,
            //width: double.infinity,
          ),
          Container(
            alignment: Alignment.bottomLeft,
            child: Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.black45,
                borderRadius: BorderRadius.circular(20)
              ),
              child: Text(
                nameDog,
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );

    Image.asset(
      pathFile,
      fit: BoxFit.contain,
    );
  }
}
