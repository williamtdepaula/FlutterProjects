import 'package:dio/dio.dart';
import 'package:flutter_dogs/app/modules/detail_breed/models/breed_image.dart';
import 'package:flutter_dogs/app/modules/home/models/breed.dart';
import 'package:flutter_dogs/app/shared/errors/errors.dart';
import 'package:flutter_dogs/app/shared/infra/datasource/dogs_datasource_interface.dart';
import 'dogs_repository_interface.dart';

class DogsRepository implements IDogsRepository {
  IDogsDataSource dogsDataSource;

  DogsRepository({this.dogsDataSource});

  @override
  Future<List<Breed>> getBreeds() async {
    try {
      Response response = await dogsDataSource.getBreeds();

      if (response.statusCode == 200) {
        //print(response.data);

        String status = response.data['status'];

        if (status == 'success') {
          final message = response.data['message'];

          List<Breed> breeds = [];

          message.entries
              .forEach((value) => breeds.add(Breed(breedName: value.key)));

          return breeds;
        } else {
          throw BreedError();
        }
      } else {
        throw BreedError();
      }
    } catch (e) {
      throw BreedError();
    }
  }

  @override
  Future<List<BreedImage>> getBreedImages(Breed breed) async {
    if (breed != null) {
      Response response = await dogsDataSource.getBreedImages(breed.breedName);

      if (response.statusCode == 200) {
        String status = response.data['status'];

        if (status == 'success') {
          final message = response.data['message'];

          List<BreedImage> breedImages = [];

          message.forEach(
              (value) => breedImages.add(BreedImage(urlPicture: value)));

          return breedImages;
        } else {
          throw BreedError();
        }
      }
    }
    throw ('teste');
  }
}
