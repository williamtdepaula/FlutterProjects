import 'package:cars_flutter/screens/loginPage.dart';

import '../../utils/Helper.dart';
import 'package:flutter/material.dart';

class DrawerDefault extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _handleRenderDrawer(context);
  }

  SafeArea _handleRenderDrawer(context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://cdn4.iconfinder.com/data/icons/avatars-21/512/avatar-circle-human-male-3-512.png'),
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
                onPressed: () => _logoutUser(context)),
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

  void _logoutUser(BuildContext context) {
    Helper.popNavigator(context);//Fecha o drawer
    Helper.pushNavigator(context, LoginPage(), replace: true);//Volta pra tela de login
  }
}
