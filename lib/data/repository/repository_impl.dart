import 'package:dartz/dartz.dart';
import 'package:sky_booker/data/mapper/mappers.dart';
import 'package:sky_booker/data/response/response.dart';
import '../../domain/models/models.dart';
import '../../domain/repository/repository.dart';
import '../data_source/remote_data_source.dart';
import '../network/app_api.dart';
import '../network/error_handler.dart';
import '../network/failure.dart';
import '../network/network_info.dart';

class RepositoryImpl implements Repository {
  final NetworkInfo _networkInfo;
  final RemoteDataSource _remoteDataSource;

  RepositoryImpl(this._networkInfo, this._remoteDataSource,);

  @override
  Future<Either<Failure, ProductObject>> getProductData() async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.getProductList();

        if (response != null) {

          return Right(response.toDomain());
        } else {

          return Left(Failure(ApiInternalStatus.FAILURE, ResponseMessage.INTERNAL_SERVER_ERROR));
        }
      } catch (error) {

        return Left(Failure(ApiInternalStatus.FAILURE, ResponseMessage.INTERNAL_SERVER_ERROR));
      }
    } else {

      return Left(DataSourceErrors.NO_INTERNET_CONNECTION.getFailure());
    }
  }




  @override
  Future<Either<Failure, ProductObject>> searchProducts(String query) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.searchProducts(query);
        if (response != null) {
          return Right(response.toDomain() );
        } else {
          return Left(Failure(ApiInternalStatus.FAILURE, ResponseMessage.INTERNAL_SERVER_ERROR));
        }
      } catch (error) {
        return Left(Failure(ApiInternalStatus.FAILURE, ResponseMessage.INTERNAL_SERVER_ERROR));
      }
    } else {
      return Left(DataSourceErrors.NO_INTERNET_CONNECTION.getFailure());
    }
  }




}
