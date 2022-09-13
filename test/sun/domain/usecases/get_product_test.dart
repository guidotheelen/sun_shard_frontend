// 📦 Package imports:
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// 🌎 Project imports:
import '../../../../lib/sun/domain/entities/product.dart';
import '../../../../lib/sun/domain/repositories/product_repository.dart';
import '../../../../lib/sun/domain/usecases/get_product.dart';

class MockProductRepository extends Mock implements ProductRepository {}

void main() {
  late GetProduct usecase;
  late MockProductRepository mockProductRepository;

  setUp(() {
    mockProductRepository = MockProductRepository();
    usecase = GetProduct(mockProductRepository);
  });

  const tID = '1';
  final tProduct = Product(id: '1', name: 'test');

  test(
    'should get product from the repository',
    () async {
      when(() => mockProductRepository.getProduct('1'))
          .thenAnswer((_) async => Right(tProduct));

      final result = await usecase(const Params(id: tID));

      expect(result, Right(tProduct));
      verify(() => mockProductRepository.getProduct(tID)).called(1);
      verifyNoMoreInteractions(mockProductRepository);
    },
  );
}
