import 'package:dartz/dartz.dart';
import 'package:sky_booker/data/network/failure.dart';
import 'package:sky_booker/domain/models/models.dart';
import 'package:sky_booker/domain/repository/repository.dart';
import 'package:sky_booker/domain/usecase/base_usecase.dart';

 class HomeUseCase extends BaseUseCase<void ,ProductObject>{
  final Repository _repository;

  HomeUseCase(this._repository);

  @override
  Future<Either<Failure, ProductObject>> call(void input)async{
    return await _repository.getProductData();
  }

}