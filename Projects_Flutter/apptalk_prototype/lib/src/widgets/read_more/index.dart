import 'package:flutter/material.dart';

class ReadMore extends StatefulWidget {
  String text;
  int size;

  ReadMore(this.text, {this.size = 80});

  @override
  _ReadMore createState() => _ReadMore();
}

class _ReadMore extends State<ReadMore> {
  String allText = '';
  bool isShowingAll = false;

  @override
  void initState() {
    super.initState();

    defineText(false);
  }

  void defineText(showAll) {
    String textToShow = '';

    if (!showAll) {
      textToShow = widget.text.substring(0, widget.size) + '...';
    }
    else{
      textToShow = widget.text;
    }

    this.setState(() {
      isShowingAll = showAll;
      allText = textToShow;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(allText),
          InkWell(
            onTap: (){
              defineText(!isShowingAll);
            },
            child: Text(
              isShowingAll ? 'Mostrar menos' : 'Mostrar mais',
              style: TextStyle(color: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }
}
