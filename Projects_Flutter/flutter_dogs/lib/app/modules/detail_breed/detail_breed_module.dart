import 'detail_breed_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'detail_breed_page.dart';

class DetailBreedModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => DetailBreedController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          Modular.initialRoute,
          child: (_, args) => DetailBreedPage(
            breed: args.data,
          ),
        ),
      ];

  static Inject get to => Inject<DetailBreedModule>.of();
}
