import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_search/modules/search/domain/entities/result_search.dart';
import 'package:github_search/modules/search/domain/errors/errors.dart';
import 'package:github_search/modules/search/domain/respositories/search_repository.dart';
import 'package:github_search/modules/search/domain/usecases/search_by_text.dart';
import 'package:mockito/mockito.dart';

class SearchRepositoryMock extends Mock implements SearchRepository{}

main() {
  final repositoryMock = new SearchRepositoryMock();
  final useCaseSearchByTextImpl = new SearchByTextImpl(repositoryMock);

  test('deve retornar uma lista de ResultSearch', () async {

    when(repositoryMock.search(any)).thenAnswer((_) async => Right(<ResultSearch>[]));  

    final result = await useCaseSearchByTextImpl('Teste');

    //expect(result, isA<Right>());
    expect(result | null, isA<List<ResultSearch>>());
  });

  test('deve retornar uma Exception caso o texto seja inválido', () async {

    when(repositoryMock.search(any)).thenAnswer((_) async => Right(<ResultSearch>[]));  

    var result = await useCaseSearchByTextImpl(null);

    //OU
    //expect(result.isLeft(), true);
    //OU
    expect(result.fold(id, id), isA<InvalidTextError>());

    result = await useCaseSearchByTextImpl('');
    
    expect(result.fold(id, id), isA<InvalidTextError>());
  });
}
