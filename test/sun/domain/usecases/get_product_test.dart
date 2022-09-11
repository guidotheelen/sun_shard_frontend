// 📦 Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

// 🌎 Project imports:
import 'package:sun_shard_frontend/sun/domain/repositories/product_repository.dart';
import 'package:sun_shard_frontend/sun/domain/usecases/get_product.dart';

class MockProductRepository extends Mock implements ProductRepository {}

void main() {
  GetProduct usecase;
  MockProductRepository mockProductRepository;

  setUp(() {
    mockProductRepository = MockProductRepository();
    usecase = GetProduct(mockProductRepository);
  });
}
