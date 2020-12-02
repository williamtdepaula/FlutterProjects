import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_slidy_app/app/app_widget.dart';
import 'package:modular_slidy_app/app/controller.dart';
import 'package:modular_slidy_app/app/screens/home/home.screen.dart';
import 'package:modular_slidy_app/app/screens/home/home_controller.dart';
import 'package:modular_slidy_app/app/screens/other_page/other.screen.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => Controller()),
        Bind((i) => HomeController()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          '/',
          child: (_, args) => HomeScreen(),
        ),
        ModularRouter(
          '/other',
          child: (_, args) => OtherScreen(),
        )
      ];
}
