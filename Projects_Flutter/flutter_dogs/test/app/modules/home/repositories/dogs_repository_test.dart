import 'package:flutter_dogs/app/modules/detail_breed/models/breed_image.dart';
import 'package:flutter_dogs/app/modules/home/models/breed.dart';
import 'package:flutter_dogs/app/shared/errors/errors.dart';
import 'package:flutter_dogs/app/shared/infra/datasource/dogs_datasource_interface.dart';
import 'package:flutter_dogs/app/shared/infra/repositories/dogs_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class DogsDataSourceMock extends Mock implements IDogsDataSource {}

main() {
  DogsDataSourceMock dogsDataSourceMock = new DogsDataSourceMock();
  DogsRepository dogsRepository =
      new DogsRepository(dogsDataSource: dogsDataSourceMock);

  test('Buscar raças', () async {
    when(dogsDataSourceMock.getBreeds()).thenAnswer((_) async => List<Breed>());

    final result = await dogsRepository.getBreeds();

    expect(result is List<Breed>, true);
  });

  test('Falhar ao buscar raças', () async {
    when(dogsDataSourceMock.getBreeds()).thenAnswer((_) => throw BreedError());

    verify(dogsDataSourceMock.getBreeds());

    expect(dogsRepository.getBreeds, isA<BreedError>());
  });

  test('Buscar imagens de uma raça em específica', () async {
    when(dogsDataSourceMock.getBreedImages('afghan'))
        .thenAnswer((_) async => List<BreedImage>());

    final result =
        await dogsRepository.getBreedImages(Breed(breedName: 'pinscher'));

    expect(result is List<BreedImage>, true);
  });

  test('Buscar imagens de uma raça em específica sem passar a raça', () async {
    final result = await dogsRepository.getBreedImages(null);

    expect(result, 'teste');
  });
}
