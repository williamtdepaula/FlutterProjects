import 'package:first_app_flutter/utils/Helper.dart';
import 'package:flutter/material.dart';

class DrawerDefault extends StatelessWidget {
  BuildContext contextOfFatherWidget;

  DrawerDefault(this.contextOfFatherWidget);

  @override
  Widget build(BuildContext context) {
    return _handleRenderDrawer();
  }

  SafeArea _handleRenderDrawer() {
    return SafeArea(
      child: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/imgs/dog1.png'),
              ),
              accountEmail: Text('williamtristao@hotmail.com'),
              accountName: Text('William Tristão'),
              decoration: BoxDecoration(color: Colors.blue),
            ),
            _handleRenderItemListDrawer(
                Icons.star, 'Favoritos', 'clique aqui...', Icons.arrow_forward),
            _handleRenderItemListDrawer(
                Icons.help, 'Ajuda', 'clique aqui...', Icons.arrow_forward),
            _handleRenderItemListDrawer(
                Icons.close, 'Fechar', 'clique aqui...', Icons.arrow_forward,
                onPressed: () => Helper.popNavigator(contextOfFatherWidget)),
          ],
        ),
      ),
    );
  }

  _handleRenderItemListDrawer(
      IconData iconLeft, String title, String subTitle, IconData iconRight,
      {onPressed = null}) {
    return ListTile(
      leading: Icon(iconLeft),
      title: Text(title),
      subtitle: Text(subTitle),
      trailing: Icon(iconRight),
      onTap: () => onPressed(),
    );
  }
}
