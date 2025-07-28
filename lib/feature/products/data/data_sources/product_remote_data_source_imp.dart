import 'package:bloc_demo_project/core/constants/app_strings.dart'
    show ErrorStrings;
import 'package:bloc_demo_project/core/network/api_result.dart'
    show Failure, Success;
import 'package:bloc_demo_project/feature/products/data/data_sources/product_remote_data_source.dart'
    show ProductsRemoteDataSource;
import 'package:bloc_demo_project/feature/products/data/models/products_list.dart'
    show ProductList;
import 'package:bloc_demo_project/core/network/api_config.dart' show ApiConfig;
import 'package:bloc_demo_project/core/network/api_helper.dart' show ApiHelper;
import 'package:bloc_demo_project/core/network/requirest_type.dart';

class ProductsRemoteDataSourceImp implements ProductsRemoteDataSource {
  final ApiHelper apiHelper;

  ProductsRemoteDataSourceImp(this.apiHelper);

  @override
  Future<List<ProductList>> getProducts({
    required Map<String, dynamic>? queryParams,
    required String? pathParams,
  }) async {
    var response = await apiHelper.request(
      method: RequestType.get,
      endPoint: ApiConfig.products,
      queryParams: queryParams,
      pathParams: pathParams,
      decoder:
          (data) =>
              List<ProductList>.from(data.map((x) => ProductList.fromJson(x))),
    );
    if (response is Success<List<ProductList>>) {
      return response.data;
    } else if (response is Failure) {
      throw response;
    }
    throw Exception(ErrorStrings.unknownError);
  }
}
