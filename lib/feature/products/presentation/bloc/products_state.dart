import 'package:bloc_demo_project/core/constants/common_enums.dart'
    show ListGetType;
import 'package:bloc_demo_project/feature/products/domain/entities/produsts.dart'
    show ProductListLocal;
import 'package:freezed_annotation/freezed_annotation.dart';
part 'products_state.freezed.dart';

@freezed
sealed class ProductsState with _$ProductsState {
  const factory ProductsState.initial() = ProductsInitial;

  const factory ProductsState.loading({required bool isLoading}) =
      ProductsLoading;

  const factory ProductsState.success({
    required List<ProductListLocal> products,
    required ListGetType listGetState,
  }) = ProductsSuccess;

  const factory ProductsState.failure({required String error}) =
      ProductsFailure;
}
