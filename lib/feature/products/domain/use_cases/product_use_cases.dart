import 'package:bloc_demo_project/core/network/api_result.dart' show Failure;
import 'package:bloc_demo_project/feature/products/domain/entities/produsts.dart'
    show ProductListLocal;
import 'package:fpdart/fpdart.dart' show Either;

import '../repositories/product_repository.dart' show ProductsRepository;

class ProductsUseCase {
  final ProductsRepository productsRepository;
  ProductsUseCase(this.productsRepository);

  Future<Either<Failure, List<ProductListLocal>>> getProducts({
    required Map<String, dynamic>? queryParams,
    required String? pathParams,
  }) async {
    return await productsRepository.getProducts(
      queryParams: queryParams,
      pathParams: pathParams,
    );
  }
}
