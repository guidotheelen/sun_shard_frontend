import 'package:sun_shard_frontend/sun_shard/domain/entities/product.dart';

import 'package:sun_shard_frontend/core/error/failures.dart';

import 'package:dartz/dartz.dart';

import '../../domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  @override
  Future<Either<Failure, Product>> getProduct(String id) {
    // TODO: implement getProduct
    throw UnimplementedError();
  }
}
