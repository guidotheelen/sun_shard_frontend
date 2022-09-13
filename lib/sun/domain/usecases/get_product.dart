// 📦 Package imports:
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

// 🌎 Project imports:
import '../../../core/error/failures.dart';
import '../../../core/usecases/usecase.dart';
import '../entities/product.dart';
import '../repositories/product_repository.dart';

class GetProduct extends UseCase<Product, Params> {
  final ProductRepository repository;

  GetProduct(this.repository);

  Future<Either<Failure, Product>> execute({required String id}) async {
    return await repository.getProduct(id);
  }

  @override
  Future<Either<Failure, Product>> call(Params params) {
    return repository.getProduct(params.id);
  }
}

class Params extends Equatable {
  final String id;

  const Params({required this.id}) : super();

  @override
  List<Object?> get props => throw UnimplementedError();
}
