import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_search/modules/search/domain/errors/errors.dart';
import 'package:github_search/modules/search/infra/datasource/search_datasource.dart';
import 'package:github_search/modules/search/infra/models/result_search_model.dart';
import 'package:github_search/modules/search/infra/repositories/search_repository_impl.dart';
import 'package:mockito/mockito.dart';

class SearchDatasourceMock extends Mock implements SearchDataSource {}

main() {
  SearchDatasourceMock datasourceMock = new SearchDatasourceMock();
  SearchRepositoryImpl searchRepositoryImpl =
      new SearchRepositoryImpl(datasource: datasourceMock);

  test('deve retornar uma lista de ResultSearch', () async {
    when(datasourceMock.getSearch(any))
        .thenAnswer((_) async => List<ResultSearchModel>());

    final result = await searchRepositoryImpl.search('teste');

    expect(result | null, isA<List<ResultSearchModel>>());
  });

  test('deve retornar um erro se o datasource falhar', () async {
    when(datasourceMock.getSearch(any))
        .thenThrow((_) async => Exception());

    final result = await searchRepositoryImpl.search('teste');

    expect(result.fold(id, id), isA<DataSourceSearchError>());
  });
}
