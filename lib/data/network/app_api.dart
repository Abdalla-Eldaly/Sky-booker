import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../app/constants.dart';
import '../response/response.dart';
part 'app_api.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class AppServicesClient {
  factory AppServicesClient(Dio dio, {String baseUrl}) = _AppServicesClient;

  @GET('/products')
  Future<ProductListResponse> getHomeProductData();

  @GET("/products/search")
  Future<ProductListResponse> searchProducts(@Query("q") String query);
}

class AppServiceClientImpl {
  final AppServicesClient _client;

  AppServiceClientImpl(Dio dio)
      : _client = AppServicesClient(dio);

  Future<ProductListResponse> getHomeProductData() {
    return _client.getHomeProductData();
  }

  Future<ProductListResponse> searchProducts(String query) {
    return _client.searchProducts(query);
  }
}
