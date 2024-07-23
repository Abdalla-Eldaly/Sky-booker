
import '../network/app_api.dart';
import '../response/response.dart';
abstract class RemoteDataSource {

  Future<ProductListResponse> getProductList();

  Future<ProductListResponse> searchProducts(String query);

}

class RemoteDataSourceImpl implements RemoteDataSource {
  final AppServicesClient _appServicesClient;

  RemoteDataSourceImpl(this._appServicesClient);

  @override
  Future<ProductListResponse> getProductList() async {
    return await _appServicesClient.getHomeProductData();
  }

  @override
  Future<ProductListResponse> searchProducts(String query) async {
    return await _appServicesClient.searchProducts(query);
  }
}
