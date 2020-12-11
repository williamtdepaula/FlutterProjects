import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_mobx_modular_slidy_firebase/app/modules/home/widgets/dialogs/dialog_add_item.dart';
import 'package:flutter_mobx_modular_slidy_firebase/app/modules/home/widgets/list/item_todo.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
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
          onChanged: controller.setFilter,
        ),
        centerTitle: false,
      ),
      body: _handlerRenderBody(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => showAlertDialogAddItem(
          context,
          onCreateItem: controller.addItem,
        ),
      ),
    );
  }

  Widget _handlerRenderBody() {
    return SafeArea(
      child: Observer(
        builder: (_) {
          return ListView.builder(
            itemCount: controller.filteredList.length,
            itemBuilder: (BuildContext context, int index) {
              return ItemTodo(
                item: controller.filteredList[index],
                onRemove: controller.removeItem,
              );
            },
          );
        },
      ),
    );
  }
}
