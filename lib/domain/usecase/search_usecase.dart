// search_product_usecase.dart
import 'package:dartz/dartz.dart';
import '../../data/network/failure.dart';
import '../../domain/models/models.dart';
import '../repository/repository.dart';
import 'base_usecase.dart';

class SearchProductUseCase extends BaseUseCase<SearchProductUseCaseInput, ProductObject> {
  final Repository _repository;

  SearchProductUseCase(this._repository);

  @override
  Future<Either<Failure, ProductObject>> call(SearchProductUseCaseInput input) async {
    return await _repository.searchProducts(input.query);
  }
}

class SearchProductUseCaseInput {
  final String query;

  SearchProductUseCaseInput({required this.query});
}
