import 'package:flutter_dogs/app/modules/home/models/breed.dart';
import 'package:flutter_dogs/app/shared/infra/repositories/dogs_repository.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  DogsRepository dogsRepository;

  _HomeControllerBase({this.dogsRepository}) {
    this.onLoadWidget();
  }

  @observable
  bool loading = true;

  @observable
  ObservableList<Breed> breeds = <Breed>[].asObservable();

  @action
  void setLoading(bool value) => this.loading = value;

  @action
  Future onLoadWidget() async {
    this.loading = true;

    List<Breed> responseBreeds = await dogsRepository.getBreeds();

    breeds = responseBreeds.asObservable();

    this.loading = false;
  }

  openBreed(Breed breed) {
    Modular.to.pushNamed('/detail_breed', arguments: breed);
  }
}
