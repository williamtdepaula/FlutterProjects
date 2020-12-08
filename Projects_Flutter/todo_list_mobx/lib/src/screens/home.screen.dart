import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:todo_list_mobx/src/controllers/controller_home.dart';
import 'package:todo_list_mobx/src/models/item_model.dart';
import 'package:todo_list_mobx/src/widgets/alert_dialog/alert_dialog_add_item.dart';
import 'package:todo_list_mobx/src/widgets/list/item_todo.dart';

class HomeScreen extends StatefulWidget {
  static String id = '/';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ControllerHome _controllerHome = new ControllerHome();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(
            hintText: 'Pesquisa...',
            hintStyle: TextStyle(color: Colors.white),
            border: InputBorder.none,
          ),
          style: TextStyle(color: Colors.white),
          onChanged: _controllerHome.setFilter,
        ),
        centerTitle: false,
      ),
      body: _handlerRenderBody(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => showAlertDialogAddItem(
          context,
          onCreateItem: _controllerHome.addItem,
        ),
      ),
    );
  }

  Widget _handlerRenderBody() {
    return SafeArea(
      child: Observer(
        builder: (_) {
          return ListView.builder(
            itemCount: _controllerHome.filteredList.length,
            itemBuilder: (BuildContext context, int index) {
              return ItemTodo(
                itemModel: _controllerHome.filteredList[index],
                onRemove: _controllerHome.removeItem,
              );
            },
          );
        },
      ),
    );
  }
}
