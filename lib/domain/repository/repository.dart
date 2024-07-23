import 'package:sky_booker/data/network/failure.dart';
import 'package:dartz/dartz.dart';

import '../models/models.dart';

abstract class Repository{
  Future<Either<Failure, ProductObject>>getProductData();

  Future<Either<Failure, ProductObject>> searchProducts(String query);

}