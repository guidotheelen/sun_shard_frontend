// 📦 Package imports:
import 'package:dartz/dartz.dart';

// 🌎 Project imports:
import '../../../core/error/failure.dart';
import '../../domain/entities/product.dart';
import '../../domain/repositories/product_repository.dart';
import '../../../core/error/exception.dart';
import '../../../core/network/network_info.dart';
import '../datasources/product_local_data_source.dart';
import '../datasources/product_remote_datasource.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;
  final ProductLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  ProductRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, Product>> getProduct(String id) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteProduct = await remoteDataSource.getProduct(id);
        localDataSource.cacheProduct(remoteProduct);
        return Right(remoteProduct);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      final localTrivia = await localDataSource.getLastProduct();
      return Right(localTrivia);
    }
  }
}
