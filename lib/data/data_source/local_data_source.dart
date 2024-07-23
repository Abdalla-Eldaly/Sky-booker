import '../../domain/models/models.dart';

const CACHE_kEY = 'CACHE_kEY';

abstract class LocalDataSource {
  Future<ProductObject> getProduct();

  Future<void> saveProduct(ProductObject product);
}

class LocalDataSourceImpl extends LocalDataSource {
  Map<String, CachedItem> cache = Map();

  @override
  Future<ProductObject> getProduct() {
    // TODO: implement getProduct
    throw UnimplementedError();
  }

  @override
  Future<void> saveProduct(ProductObject product) async {
    cache[CACHE_kEY] = CachedItem(product);
  }
}

class CachedItem {
  dynamic data;
  int cacheTime = DateTime.now().millisecondsSinceEpoch;

  CachedItem(this.data);
}
