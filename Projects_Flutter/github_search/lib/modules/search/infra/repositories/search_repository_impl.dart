import 'package:flutter/material.dart';
import 'package:github_search/modules/search/domain/errors/errors.dart';
import 'package:github_search/modules/search/domain/entities/result_search.dart';
import 'package:dartz/dartz.dart';
import 'package:github_search/modules/search/domain/respositories/search_repository.dart';
import 'package:github_search/modules/search/infra/datasource/search_datasource.dart';

class SearchRepositoryImpl implements SearchRepository {
  SearchDataSource datasource;

  SearchRepositoryImpl({@required this.datasource});

  @override
  Future<Either<FailureSearch, List<ResultSearch>>> search(
      String searchText) async {
    try {
      final result = await datasource.getSearch(searchText);

      return Right(result);
    } catch (e) {
      return Left(DataSourceSearchError());
    }
  }
}
