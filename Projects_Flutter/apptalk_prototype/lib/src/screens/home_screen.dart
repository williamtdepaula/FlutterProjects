import 'package:apptalk_prototype/src/models/Content.dart';
import 'package:apptalk_prototype/src/models/Feed.dart';
import 'package:apptalk_prototype/src/widgets/list/item_home_list.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  List<Feed> feeds = [
    Feed(
      'https://media-exp1.licdn.com/dms/image/C4E03AQH7i3XV45KPOg/profile-displayphoto-shrink_200_200/0?e=1596067200&v=beta&t=6rrkuDOGtf_31l2ZZRT05qyGr6W9RLoYxTcUs6Wmerg',
      'William Tristão de Paula',
      'Há 5 dias',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      [
        Content(
          'https://www.travelanddestinations.com/wp-content/uploads/2019/10/Ban-Gioc-Detian-Waterfalls-Vietnam-1.jpg',
          true,
          1.52963671128,
        ),
        Content(
          'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/most-beautiful-places-in-the-world-gettyimages-1042549972.jpg',
          true,
          0.66691367173,
        )
      ],
    ),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('FEEDS')),
      ),
      body: _handleRenderBody(),
    );
  }

  _handleRenderBody() {
    return Container(
      child: ListView.builder(
          itemCount: feeds.length,
          itemBuilder: (BuildContext context, i) {
            return ItemHomeList(feeds[i]);
          }),
    );
  }
}
