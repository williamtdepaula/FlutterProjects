import 'package:github_search/modules/search/domain/errors/errors.dart';
import 'package:github_search/modules/search/domain/entities/result_search.dart';
import 'package:dartz/dartz.dart';
import 'package:github_search/modules/search/domain/respositories/search_repository.dart';

class SearchRepositoryImpl implements SearchRepository{
  @override
  Future<Either<FailureSearch, List<ResultSearch>>> search(String searchText) {
    
  }
}