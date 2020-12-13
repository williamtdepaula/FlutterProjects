import 'package:flutter/material.dart';
import 'package:flutter_dogs/app/modules/detail_breed/models/breed_image.dart';
import 'package:flutter_dogs/app/modules/home/models/breed.dart';
import 'package:flutter_dogs/app/shared/infra/repositories/dogs_repository_interface.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'detail_breed_controller.g.dart';

@Injectable()
class DetailBreedController = _DetailBreedControllerBase
    with _$DetailBreedController;

abstract class _DetailBreedControllerBase with Store {
  IDogsRepository dogsRepository = Modular.get();

  final PagingController<int, BreedImage> pagingController =
      PagingController(firstPageKey: 0);

  Breed _breedSelected;

  int pageKey = 0;

  ScrollController scrollController = new ScrollController();

  _DetailBreedControllerBase() {
    pagingController.addPageRequestListener((pageKey) {
      this.loadListBreedImages(pageKey);
    });
  }

  void setBreedSelected(Breed breedSelected) =>
      this._breedSelected = breedSelected;

  @action
  Future<void> loadListBreedImages(pageKey, {bool reset = false}) async {
    List<BreedImage> breedImagesResponse =
        await dogsRepository.getBreedImages(_breedSelected);

    if (reset) {
      this.pagingController.itemList = breedImagesResponse;
    } else {
      this.pageKey = pageKey + 1;
      this.pagingController.appendPage(breedImagesResponse, pageKey);
    }
  }
}
