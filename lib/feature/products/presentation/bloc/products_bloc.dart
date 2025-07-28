import 'package:bloc_demo_project/feature/products/domain/use_cases/product_use_cases.dart'
    show ProductsUseCase;
import 'package:bloc_demo_project/feature/products/presentation/bloc/products_event.dart';
import 'package:bloc_demo_project/feature/products/presentation/bloc/products_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/common_enums.dart' show ListGetType;

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductsUseCase _productsUseCase;
  ProductsBloc({required ProductsUseCase productsUseCase})
    : _productsUseCase = productsUseCase,
      super(const ProductsState.initial()) {
    on<ProductsEvent>((event, emit) async {
      event.when(
        initial: () => emit(const ProductsState.initial()),
        getList: (listGetState) async {
          _getProductsList(emit, listGetState);
        },
      );
    });
  }
  _getProductsList(
    Emitter<ProductsState> emit,
    ListGetType listGetState,
  ) async {
    emit(ProductsState.loading(isLoading: true));
    final products = await _productsUseCase.getProducts(
      queryParams: {},
      pathParams: '',
    );
    emit(ProductsState.loading(isLoading: false));
    products.match(
      (failure) => emit(ProductsState.failure(error: failure.message)),
      (products) => emit(
        ProductsState.success(products: products, listGetState: listGetState),
      ),
    );
  }
}
