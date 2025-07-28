import 'package:bloc_demo_project/feature/products/domain/entities/produsts.dart'
    show ProductListLocal;
import 'package:fpdart/fpdart.dart';
import '../../../../core/network/api_result.dart';

abstract class ProductsRepository {
  Future<Either<Failure, List<ProductListLocal>>> getProducts({
    required Map<String, dynamic>? queryParams,
    required String? pathParams,
  });
}
