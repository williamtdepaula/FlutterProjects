import 'package:app_todo/src/components/list/item_todo.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static final id = '/home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: _handlerRenderBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  _handlerRenderBody() {
    return Column(
      children: <Widget>[
        Expanded(flex: 1, child: _handlerRenderHeader()),
        Expanded(flex: 2, child: _handlerRenderList()),
      ],
    );
  }

  _handlerRenderHeader() {
    return Container(
      padding: EdgeInsets.all(50),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          _handlerRenderMenuButton(),
          SizedBox(height: 50),
          Text(
            'Todoey',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 40,
            ),
          ),
          Text(
            '12 Tasks',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }

  _handlerRenderMenuButton() {
    return RawMaterialButton(
      onPressed: null,
      shape: CircleBorder(),
      fillColor: Colors.white,
      padding: EdgeInsets.all(10),
      child: Icon(
        Icons.list,
        size: 50,
        color: Colors.lightBlueAccent,
      ),
    );
  }

  _handlerRenderList() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: ListView.builder(
        itemCount: 2,
        itemBuilder: (BuildContext contenxt, index) {
          return ItemTodo();
        },
      ),
    );
  }
}
