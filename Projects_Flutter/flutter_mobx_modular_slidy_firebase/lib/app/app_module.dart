import 'package:flutter_mobx_modular_slidy_firebase/app/shared/repositories/localstorage/local_storage_hive.dart';
import 'package:flutter_mobx_modular_slidy_firebase/app/shared/repositories/localstorage/local_storage_interface.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx_modular_slidy_firebase/app/app_widget.dart';
import 'package:flutter_mobx_modular_slidy_firebase/app/modules/home/home_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind<ILocalStorage>((i) => LocalStorageHive()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, module: HomeModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
