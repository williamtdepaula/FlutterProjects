import 'package:flutter_mobx_modular_slidy_firebase/app/app_module.dart';
import 'package:flutter_mobx_modular_slidy_firebase/app/shared/repositories/localstorage/local_storage_interface.dart';
import 'package:flutter_mobx_modular_slidy_firebase/app/shared/repositories/localstorage/local_storage_mock.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_mobx_modular_slidy_firebase/app/modules/home/home_controller.dart';
import 'package:flutter_mobx_modular_slidy_firebase/app/modules/home/home_module.dart';

void main() {
  initModule(AppModule(), changeBinds: [
    Bind<ILocalStorage>((i) => LocalStorageMock()),
  ]);
  initModule(HomeModule());

  test('Salvar item', () async {
    HomeController homeController = Modular.get();

    homeController.setItem('teste');

    homeController.addItem();

    expect(homeController.listItems.length, 1);
    expect(homeController.listItems[0], 'teste');

    List<String> listStorage = await Modular.get<ILocalStorage>().get('key');

    expect(listStorage[0], 'teste');
  });

  test('Remover item', () async {
    HomeController homeController = Modular.get();

    homeController.setItem('teste');

    homeController.addItem();

    homeController.removeItem('teste');

    expect(homeController.listItems.length, 0);

    List<String> listStorage = await Modular.get<ILocalStorage>().get('key');

    expect(listStorage.isEmpty, true);
  });
}
