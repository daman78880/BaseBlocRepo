import 'package:bloc_demo_project/feature/products/data/models/products_list.dart'
    show ProductList;

abstract class ProductsRemoteDataSource {
  Future<List<ProductList>> getProducts({
    required Map<String, dynamic>? queryParams,
    required String? pathParams,
  });

  Future<ProductList> getProductDetail({required String pathParams});
}
