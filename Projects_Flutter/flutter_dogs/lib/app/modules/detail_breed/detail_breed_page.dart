import 'package:flutter/material.dart';
import 'package:flutter_dogs/app/modules/detail_breed/components/item_list/item_list_breed_image.dart';
import 'package:flutter_dogs/app/modules/detail_breed/components/warning/without_image.dart';
import 'package:flutter_dogs/app/modules/detail_breed/detail_breed_controller.dart';
import 'package:flutter_dogs/app/modules/detail_breed/models/breed_image.dart';
import 'package:flutter_dogs/app/modules/home/models/breed.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class DetailBreedPage extends StatefulWidget {
  final Breed breed;

  const DetailBreedPage({this.breed});

  @override
  _DetailBreedPageState createState() => _DetailBreedPageState();
}

class _DetailBreedPageState
    extends ModularState<DetailBreedPage, DetailBreedController> {
  //use 'controller' variable to access controller

  @override
  void initState() {
    super.initState();

    controller.setBreedSelected(widget.breed);

    controller.loadListBreedImages(0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.breed.breedName),
      ),
      body: _handlerRenderBody(),
    );
  }

  Widget _handlerRenderBody() {
    return SafeArea(
      child: Observer(
        builder: (_) {
          return RefreshIndicator(
            onRefresh: () => controller.loadListBreedImages(0, reset: true),
            child: PagedListView(
              pagingController: controller.pagingController,
              builderDelegate: PagedChildBuilderDelegate<BreedImage>(
                itemBuilder: (context, breedImage, index) => ItemListBreedImage(
                  breedImage: breedImage,
                ),
                noItemsFoundIndicatorBuilder: (context) => WithoutImage(),
              ),
            ),
          );
        },
      ),
    );
  }
}
