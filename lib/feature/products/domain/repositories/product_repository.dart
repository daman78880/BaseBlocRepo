import 'package:bloc_demo_project/feature/products/domain/entities/products_list_local.dart'
    show ProductListLocal;
import 'package:fpdart/fpdart.dart';
import '../../../../core/network/api_result.dart';

abstract class ProductsRepository {
  Future<Either<Failure, List<ProductListLocal>>> getProducts({
    required Map<String, dynamic>? queryParams,
    required String? pathParams,
  });

  Future<Either<Failure, ProductListLocal>> getProductDetail({
    required String pathParams,
  });
}
