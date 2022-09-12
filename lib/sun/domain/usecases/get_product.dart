// 🌎 Project imports:
import 'package:dartz/dartz.dart';

import 'package:sun_shard_frontend/core/error/failures.dart';
import 'package:sun_shard_frontend/sun/domain/entities/product.dart';
import 'package:sun_shard_frontend/sun/domain/repositories/product_repository.dart';

class GetProduct {
  final ProductRepository repository;

  GetProduct(this.repository);

  Future<Either<Failure, Product>> execute({required String id}) async {
    print('HOPPA');
    return await repository.getProduct(id);
  }
}
