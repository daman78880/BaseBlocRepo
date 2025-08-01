import 'package:bloc_demo_project/core/network/api_result.dart' show Failure;
import 'package:bloc_demo_project/feature/products/domain/entities/products_list_local.dart'
    show ProductListLocal;
import 'package:fpdart/fpdart.dart' show Either;

import '../repositories/product_repository.dart' show ProductsRepository;

class ProductsUseCase {
  final ProductsRepository productsRepository;
  ProductsUseCase(this.productsRepository);

  Future<Either<Failure, List<ProductListLocal>>> getProductsList({
    required Map<String, dynamic>? queryParams,
    required String? pathParams,
  }) async {
    return await productsRepository.getProducts(
      queryParams: queryParams,
      pathParams: pathParams,
    );
  }

  Future<Either<Failure, ProductListLocal>> getProductDetail({
    required String pathParams,
  }) async {
    return await productsRepository.getProductDetail(pathParams: pathParams);
  }
}
