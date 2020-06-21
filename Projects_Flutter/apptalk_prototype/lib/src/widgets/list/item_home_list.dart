import 'package:apptalk_prototype/src/models/Feed.dart';
import 'package:apptalk_prototype/src/widgets/react/react.dart';
import 'package:apptalk_prototype/src/widgets/read_more/index.dart';
import 'package:flutter/material.dart';

class ItemHomeList extends StatefulWidget {
  Feed feed;

  ItemHomeList(this.feed);

  @override
  _ItemHomeList createState() => _ItemHomeList();
}

class _ItemHomeList extends State<ItemHomeList> {
  PageController pageController = new PageController(initialPage: 0);
  double pageRatio = 0.0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          handleRenderTitle(),
          handleRenderDesc(),
          handleRenderContent(),
          handleRenderActionsFeed()
        ],
      ),
      //Reactions()
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
    );
  }

  handleRenderTitle() {
    final DEVICE_SIZE = MediaQuery.of(context).size;
    final SIZE_IMAGE = (DEVICE_SIZE.width / 8);

    return Row(
      children: <Widget>[
        Flexible(
          flex: 1,
          child: Container(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(SIZE_IMAGE / 2),
              child: Image.network(
                widget.feed.imageRedactor,
                width: SIZE_IMAGE,
                height: SIZE_IMAGE,
              ),
            ),
          ),
        ),
        Flexible(
          flex: 3,
          child: Container(
            margin: EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(widget.feed.nameRedactor),
                Text(widget.feed.datePost),
              ],
            ),
          ),
        ),
      ],
    );
  }

  handleRenderDesc() {
    return Container(
        margin: EdgeInsets.only(top: 10),
        child: ReadMore(widget.feed.desc, size: 80));
  }

  onPageChange(page) {
    this.setState(() {
      pageRatio = widget.feed.content[page].aspectRatio;
    });
  }

  handleRenderContent() {
    return AspectRatio(
      aspectRatio:
          pageRatio != 0.0 ? pageRatio : widget.feed.content[0].aspectRatio,
      child: PageView(
        onPageChanged: onPageChange,
        controller: pageController,
        children: <Widget>[
          Image.network(
            widget.feed.content[0].link,
            fit: BoxFit.cover,
          ),
          Image.network(
            widget.feed.content[1].link,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }

  handleRenderActionsFeed() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        React(),
        Text('Comentar'),
      ],
    );
  }
}
