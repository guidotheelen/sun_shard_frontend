// 🌎 Project imports:
import '../models/product_model.dart';

abstract class ProductLocalDataSource {
  /// Gets the cached [ProductModel] which was gotten the last time
  /// the user had an internet connection.
  Future<ProductModel> getLastProduct();

  Future<void> cacheProduct(ProductModel triviaToCache);
}
