import 'dart:developer' show log;

import 'package:bloc_demo_project/feature/products/domain/entities/products_list_local.dart'
    show ProductListLocal;
import 'package:bloc_demo_project/feature/products/domain/use_cases/product_use_cases.dart'
    show ProductsUseCase;
import 'package:bloc_demo_project/feature/products/presentation/bloc/products_event.dart';
import 'package:bloc_demo_project/feature/products/presentation/bloc/products_state.dart';
import 'package:bloc_demo_project/feature/products/presentation/bloc/products_state.dart'
    as products_state;
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
        getProductDetail: (id) async {
          await _getProductDetail(emit, id);
        },
      );
    });
    // Trigger event after bloc is fully constructed
    // Only trigger if we're in initial state to avoid duplicate calls
    if (state is products_state.ProductsInitial) {
      Future.microtask(() {
        add(ProductsEvent.getList(listGetState: ListGetType.isFromStart));
      });
    }
  }
  _getProductsList(
    Emitter<ProductsState> emit,
    ListGetType listGetState,
  ) async {
    List<ProductListLocal> currentList = state.maybeWhen(
      success: (products, _, maxReached) => products,
      orElse: () => [],
    );
    bool maxReached = state.maybeWhen(
      success: (products, _, maxReached) => maxReached,
      orElse: () => false,
    );

    if (listGetState == ListGetType.isFromPagination) {
      emit(ProductsState.loadingMore(isLoadingMore: true));
    } else {
      emit(ProductsState.loading(isLoading: true));
    }

    final products = await _productsUseCase.getProductsList(
      queryParams: {"limit": 15, "offset": currentList.length},
      pathParams: '',
    );

    if (listGetState == ListGetType.isFromPagination) {
      emit(ProductsState.loadingMore(isLoadingMore: false));
    } else {
      emit(ProductsState.loading(isLoading: false));
    }

    final result = products.fold(
      (failure) => ProductsState.failure(error: failure.message),
      (newItems) {
        if (newItems.isEmpty) {
          maxReached = true;
        } else {
          maxReached = false;
        }
        final merged = switch (listGetState) {
          ListGetType.isFromPagination => [
            ...currentList,
            ...newItems.where((p) => !currentList.any((e) => e.id == p.id)),
          ],
          _ => newItems,
        };

        return ProductsState.success(
          products: merged,
          listGetState: listGetState,
          maxReached: maxReached,
        );
      },
    );

    emit(result);
  }

  _selectProduct(Emitter<ProductsState> emit, int index) async {
    log('selectProduct: $index');
    List<ProductListLocal> products = state.maybeWhen(
      success: (products, listGetState, maxReached) => products,
      orElse: () => [],
    );
    bool maxReached = state.maybeWhen(
      success: (products, listGetState, maxReached) => maxReached,
      orElse: () => false,
    );
    // Create a new list with updated product
    List<ProductListLocal> updatedProducts = List.from(products);
    updatedProducts[index] = updatedProducts[index].copyWith(
      isSelected: !(updatedProducts[index].isSelected),
    );
    emit(
      ProductsState.success(
        products: updatedProducts,
        listGetState: ListGetType.isFromStart,
        maxReached: maxReached,
      ),
    );
  }

  _getProductDetail(Emitter<ProductsState> emit, int id) async {
    emit(ProductsState.loading(isLoading: true));
    String pathParams = '/$id';
    final product = await _productsUseCase.getProductDetail(
      pathParams: pathParams,
    );
    final result = product.fold(
      (failure) => ProductsState.failure(error: failure.message),
      (product) => ProductsState.productDetail(product: product),
    );
    emit(result);
  }
}
