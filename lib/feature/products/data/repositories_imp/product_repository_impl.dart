import 'dart:developer' show log;

import 'package:bloc_demo_project/core/network/api_result.dart' show Failure;
import 'package:bloc_demo_project/feature/products/data/data_sources/product_remote_data_source.dart'
    show ProductsRemoteDataSource;
import 'package:bloc_demo_project/feature/products/domain/entities/products_list_local.dart'
    show ProductListLocal;
import 'package:bloc_demo_project/feature/products/domain/repositories/product_repository.dart'
    show ProductsRepository;
import 'package:fpdart/fpdart.dart' show Either, Left, Right;

class ProductsRepositoryImpl implements ProductsRepository {
  final ProductsRemoteDataSource productsRemoteDataSource;

  ProductsRepositoryImpl(this.productsRemoteDataSource);

  @override
  Future<Either<Failure, List<ProductListLocal>>> getProducts({
    required Map<String, dynamic>? queryParams,
    required String? pathParams,
  }) async {
    try {
      final products = await productsRemoteDataSource.getProducts(
        queryParams: queryParams,
        pathParams: pathParams,
      );
      return Right(
        products.map((e) => ProductListLocal.fromJson(e.toJson())).toList(),
      );
    } catch (e) {
      log('==========e: $e');
      if (e is Failure) {
        return Left(e);
      }
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ProductListLocal>> getProductDetail({
    required String pathParams,
  }) async {
    try {
      final product = await productsRemoteDataSource.getProductDetail(
        pathParams: pathParams,
      );
      return Right(ProductListLocal.fromJson(product.toJson()));
    } catch (e) {
      log('==========e: $e');
      if (e is Failure) {
        return Left(e);
      }
      return Left(Failure(e.toString()));
    }
  }
}
