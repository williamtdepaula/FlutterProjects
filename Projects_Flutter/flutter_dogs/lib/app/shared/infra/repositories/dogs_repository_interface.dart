import 'package:flutter_dogs/app/modules/detail_breed/models/breed_image.dart';
import 'package:flutter_dogs/app/modules/home/models/breed.dart';

abstract class IDogsRepository {
  Future<List<Breed>> getBreeds();
  Future<List<BreedImage>> getBreedImages(Breed breed);
}
