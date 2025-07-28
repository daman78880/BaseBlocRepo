import 'dart:developer' show log;

import 'package:bloc_demo_project/feature/products/domain/entities/produsts.dart'
    show ProductListLocal;
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
      await event.when(
        initial: () async => emit(const ProductsState.initial()),
        getList: (listGetState) async {
          await _getProductsList(emit, listGetState);
        },
        selectProduct: (index) async {
          await _selectProduct(emit, index);
        },
      );
    });
    // Trigger event after bloc is fully constructed
    Future.microtask(() {
      add(ProductsEvent.getList(listGetState: ListGetType.isFromStart));
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

    // Handle the result synchronously to avoid emit after completion
    final result = products.fold(
      (failure) => ProductsState.failure(error: failure.message),
      (products) =>
          ProductsState.success(products: products, listGetState: listGetState),
    );
    emit(result);
  }

  _selectProduct(Emitter<ProductsState> emit, int index) async {
    log('selectProduct: $index');
    List<ProductListLocal> products = state.maybeWhen(
      success: (products, listGetState) => products,
      orElse: () => [],
    );

    // Create a new list with updated product
    List<ProductListLocal> updatedProducts = List.from(products);
    updatedProducts[index] = ProductListLocal(
      id: products[index].id,
      title: products[index].title,
      slug: products[index].slug,
      price: products[index].price,
      description: products[index].description,
      category: products[index].category,
      images: products[index].images,
      creationAt: products[index].creationAt,
      updatedAt: products[index].updatedAt,
      isSelected: !(products[index].isSelected ?? false),
    );
    emit(
      ProductsState.success(
        products: updatedProducts,
        listGetState: ListGetType.isFromStart,
      ),
    );
  }
}
