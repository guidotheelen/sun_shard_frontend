// 🌎 Project imports:
import '../models/product_model.dart';

abstract class ProductRemoteDataSource {
  Future<ProductModel> getProduct(String id);
}
